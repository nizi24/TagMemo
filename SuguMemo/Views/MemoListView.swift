//
//  MemoListView.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/07.
//

import SwiftUI

struct MemoListView: View {
    var memos = [Memo]()
    
    var body: some View {
        List {
            ForEach(memos, id: \.self) { memo in
                NavigationLink(destination: Text("Destination")) {
                        Text("Navigate")
                }
            }
        }
        .navigationBarTitle(Text("メモ一覧"), displayMode: .inline)
    }
}

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MemoListView(memos: [Memo(context: "aaa")])
        }
    }
}
