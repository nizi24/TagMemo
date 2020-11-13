//
//  MemoList.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/13.
//

import SwiftUI

struct MemoList: View {
    @Binding var memoList: [Memo]
    @Binding var results: [Memo]
    @EnvironmentObject var memoListViewModel: MemoListViewModel
    
    init(memoList: Binding<[Memo]>, results: Binding<[Memo]> = .constant([])) {
        _memoList = memoList
        _results = results
    }
    
    var body: some View {
        List {
            ForEach(memoList, id: \.self) { memo in
                NavigationLink(destination: EditMemoVIew(viewModel: EditMemoViewModel(id: memo.id, title: memo.title, context: memo.context, tags: memo.tags))) {
                    Text(MemoDisplayProcessor(memo: memo).title())
                }
            }.onDelete(perform: { indexSet in
                memoListViewModel.deleteMemo(targetMemo: memoList[indexSet.first!])
                if results != [] {
                    results.remove(atOffsets: indexSet)
                }
            })
        }
    }
}

struct MemoList_Previews: PreviewProvider {
    static var previews: some View {
        MemoList(memoList: .constant([]))
    }
}
