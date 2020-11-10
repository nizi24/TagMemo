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
    
    var body: some View {
        VStack {
            MemoForm(title: $viewModel.title, context: $viewModel.context)
        }
        .navigationBarTitle(Text(viewModel.title), displayMode: .inline)
    }
    
    func updateMemoList(updatedMemodb: MemoDB) {
        ContentView().environmentObject(MemoListViewModel())
        var memoList = memoListViewModel.memoList
        memoList = memoList.map { memo in
            if memo.id == self.viewModel.id {
                var updateMemo = memo
                updateMemo.title = viewModel.title
                updateMemo.context = viewModel.context
                return updateMemo
            }
            return memo
        }
    }
}

struct EditMemoVIew_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditMemoVIew(viewModel: EditMemoViewModel(id: "", title: "test", context: "foobar"))
        }
    }
}
