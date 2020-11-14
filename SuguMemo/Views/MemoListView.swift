//
//  MemoListView.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/07.
//

import SwiftUI
import GoogleMobileAds

struct MemoListView: View {
    @EnvironmentObject var viewModel: MemoListViewModel
    
    var body: some View {
        NavigationView {
//            AdView()
            MemoList(memoList: $viewModel.memoList)
            .navigationBarTitle(Text("メモ一覧"), displayMode: .inline)
            .navigationBarItems(leading: EditButton(), trailing:
                NavigationLink(destination: SearchView()) {
                    Image(systemName: "magnifyingglass")
                }
            )
            .onAppear {
                viewModel.memoList = []
                viewModel.getAllInRealm(memodb: MemoDB())
            }
        }
    }
}

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView().environmentObject(MemoListViewModel())
    }
}
