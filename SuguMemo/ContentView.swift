//
//  ContentView.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                Text("一覧")
                    .tabItem {
                        VStack {
                            Text("メモ")
                        }
                    }
                CreateMemoView()
                    .tabItem {
                        VStack {
                            Text("新規作成")
                        }
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
