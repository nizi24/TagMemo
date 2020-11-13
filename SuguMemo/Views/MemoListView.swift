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
            MemoList(memoList: $viewModel.memoList)
            .navigationBarTitle(Text("メモ一覧"), displayMode: .inline)
            .navigationBarItems(leading: EditButton(), trailing:
                NavigationLink(destination: SearchView()) {
                    Image(systemName: "magnifyingglass")
                }
            )
        }
    }
}

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView().environmentObject(MemoListViewModel())
    }
}
