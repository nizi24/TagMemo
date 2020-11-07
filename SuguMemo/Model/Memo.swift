//
//  Memo.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/07.
//

import Foundation

class Memo {
    var title = ""
    var context: String
    
    init(context: String) {
        self.context = context
    }
}

extension Memo : Hashable {
    static func == (lhs: Memo, rhs: Memo) -> Bool {
        return lhs.title == rhs.title && lhs.context == rhs.context
    }
    
    public func hash(into hasher: inout Hasher) {
        title.hash(into: &hasher)
        context.hash(into: &hasher)
    }
}
