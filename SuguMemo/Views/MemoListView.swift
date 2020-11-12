//
//  MemoListView.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/07.
//

import SwiftUI

struct MemoListView: View {
    @EnvironmentObject var viewModel: MemoListViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.memoList, id: \.self) { memo in
                    NavigationLink(destination: EditMemoVIew(viewModel: EditMemoViewModel(id: memo.id, title: memo.title, context: memo.context, tags: memo.tags))) {
                        Text(memo.title)
                    }
                }.onDelete(perform: { indexSet in
                    viewModel.deleteMemo(targetMemo: viewModel.memoList[indexSet.count - 1])
                })
            }
            .navigationBarTitle(Text("メモ一覧"), displayMode: .inline)
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView().environmentObject(MemoListViewModel())
    }
}
