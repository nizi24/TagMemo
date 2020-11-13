//
//  MemoList.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/13.
//

import Foundation

struct MemoDisplayProcessor {
    var memo: Memo
    
    func title() -> String {
        if memo.title.isEmpty {
            var lines = [String]()
            memo.context.enumerateLines { (line, stop) -> () in
                lines.append(line)
            }
            var title = lines.first ?? memo.context
            title = prefix(string: title, maxLength: 20)
            return title
        } else {
            return prefix(string: memo.title, maxLength: 20)
        }
    }
    
    func prefix(string: String, maxLength: Int) -> String {
        return String(string.prefix(maxLength)) + (string.count > maxLength ? "..." : "")
    }
}
