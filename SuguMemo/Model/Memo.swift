//
//  Memo.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/07.
//

import Foundation

struct Memo: Hashable {
    var title: String
    var context: String
    
    init(context: String, title: String = "") {
        self.context = context
        self.title = title
    }
}
