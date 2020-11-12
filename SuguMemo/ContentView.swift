//
//  ContentView.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MemoListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("メモ")
                    }
                }
            CreateMemoView()
                .tabItem {
                    VStack {
                        Image(systemName: "note.text.badge.plus")
                        Text("新規作成")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
