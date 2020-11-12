//
//  EditMemoVIew.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/10.
//

import SwiftUI

struct EditMemoVIew: View {
    @ObservedObject var viewModel: EditMemoViewModel
    @EnvironmentObject var memoListViewModel: MemoListViewModel
    var updateMemoList: (MemoListViewModel, EditMemoViewModel) -> Void = { memoListViewModel, viewModel in
        let memoList = memoListViewModel.memoList
        memoListViewModel.memoList = memoList.map { memo in
            if memo.id == viewModel.id {
                var updateMemo = memo
                updateMemo.title = viewModel.title
                updateMemo.context = viewModel.context
                updateMemo.tags = viewModel.tags
                return updateMemo
            }
            return memo
        }
    }
    
    var body: some View {
        VStack {
            MemoForm(title: $viewModel.title, context: $viewModel.context, tags: $viewModel.tags)
                .onChange(of: viewModel.title, perform: { newTitle in
                    updateMemoList(memoListViewModel, viewModel)
                })
                .onChange(of: viewModel.context, perform: { newContext in
                    updateMemoList(memoListViewModel, viewModel)
                })
        }
        .navigationBarTitle(Text(viewModel.title), displayMode: .inline)
    }
}

struct EditMemoVIew_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditMemoVIew(viewModel: EditMemoViewModel(id: "", title: "test", context: "foobar", tags: [Tag()]))
        }
    }
}
