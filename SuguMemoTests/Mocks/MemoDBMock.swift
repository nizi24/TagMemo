//
//  MemoDBMock.swift
//  SuguMemoTests
//
//  Created by Yuu Nishida on 2020/11/08.
//

import Foundation
import RealmSwift
@testable import SuguMemo

class MemoDBMock: MemoDBProtocol {
    var title = ""
    var context = ""

    init() {}
    
    init(title: String, context: String) {
        self.title = title
        self.context = context
    }
    
    func getAll() -> [MemoDBProtocol]? {
        return [
            MemoDBMock(title: "test1", context: "foo"),
            MemoDBMock(title: "test2", context: "bar"),
            MemoDBMock(title: "test3", context: "baz")
        ]
    }
    
    func saveToRealm() throws {}
}
