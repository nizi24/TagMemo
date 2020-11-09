//
//  MemoDB.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/08.
//

import Foundation
import RealmSwift

protocol MemoDBProtocol {
    var title: String { get set }
    var context: String { get set }
    
    func saveToRealm() throws -> Void
    func getAll() -> [MemoDBProtocol]?
}

class MemoDB: Object, MemoDBProtocol {
    @objc dynamic var title = ""
    @objc dynamic var context = ""
        
    func saveToRealm() throws {
        let realm = try Realm()
        try realm.write() {
            realm.add(self)
        }
    }
    
    func getAll() -> [MemoDBProtocol]? {
        let realm = try! Realm()
        let realmMemoDBArray = realm.objects(MemoDB.self)
        var memoDBArray: [MemoDB] = []
        for realmMemoDB in realmMemoDBArray {
            if let memodb = realmMemoDB as? MemoDB {
                memoDBArray.append(memodb)
            }
        }
        return memoDBArray
    }
}
