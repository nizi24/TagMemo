//
//  Tag.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/11.
//

import Foundation
import RealmSwift

class Tag: Object {
    @objc dynamic var id = NSUUID().uuidString
    @objc dynamic var name = ""
    let memos = LinkingObjects(fromType: MemoDB.self, property: "tags")
    
    override static func primaryKey() -> String? {
            return "id"
    }
}
