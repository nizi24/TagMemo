//
//  ContentView.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/07.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1
    
    var body: some View {
        TabView(selection: $selection) {
            MemoListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("メモ")
                    }
                }
                .tag(0)
            CreateMemoView()
                .tabItem {
                    VStack {
                        Image(systemName: "note.text.badge.plus")
                        Text("新規作成")
                    }
                }
                .tag(1)
        }
        .onAppear(perform: {
            Setting().findOrCreate()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
