//
//  MemoList.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/08.
//

import Foundation

struct MemoList {
    var memoList: [Memo]
    
    mutating func getAllInRealm() {
        let memodb = MemoDB()
        let result = memodb.getAll()
        for memodb in result {
            let memo = Memo(context: memodb.context, title: memodb.title)
            self.memoList.append(memo)
        }
    }
}
