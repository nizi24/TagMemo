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
                    NavigationLink(destination: Text(memo.context)) {
                        Text(memo.title)
                    }
                }
            }
            .navigationBarTitle(Text("メモ一覧"), displayMode: .inline)
        }
    }
}

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView().environmentObject(MemoListViewModel())
    }
}
