//
//  Memo.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/07.
//

import Foundation

struct Memo: Hashable {
    let id: String
    var title: String
    var context: String
    var tags: [Tag]
    
    init(id: String, context: String, tags: [Tag], title: String = "") {
        self.id = id
        self.context = context
        self.title = title
        self.tags = tags
    }
}
