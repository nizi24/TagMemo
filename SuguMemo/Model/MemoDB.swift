//
//  MemoDB.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/08.
//

import Foundation
import RealmSwift

protocol MemoDBProtocol {
    var id: String { get }
    var title: String { get set }
    var context: String { get set }
    var tags: List<Tag> { get set }
    
    func saveToRealm() throws -> MemoDB
    func getAll() -> [MemoDBProtocol]?
}

class MemoDB: Object, MemoDBProtocol {
    @objc dynamic var id = NSUUID().uuidString
    @objc dynamic var title = ""
    @objc dynamic var context = ""
    var tags = List<Tag>()
    
    override static func primaryKey() -> String? {
            return "id"
    }
    
    func saveToRealm() throws -> MemoDB {
        let realm = try Realm()
        try realm.write() {
            realm.add(self)
        }
        return self
    }
    
    func newMemoDB(memo: Memo) -> MemoDB {
        id = memo.id
        title = memo.title
        context = memo.context
        tags.append(objectsIn: memo.tags)
        return self
    }
    
    func getAll() -> [MemoDBProtocol]? {
//        print(Realm.Configuration.defaultConfiguration.fileURL)
        realmMigration()
        let realm = try! Realm()
        let realmMemoDBArray = realm.objects(MemoDB.self)
        var memoDBArray: [MemoDB] = []
        for realmMemoDB in realmMemoDBArray {
            let memodb = realmMemoDB as MemoDB
            memoDBArray.append(memodb)
        }
        return memoDBArray
    }
    
    func update() -> MemoDB {
        let realm = try! Realm()
        let editTarget = realm.objects(MemoDB.self).filter("id == %@", self.id).first
        try! realm.write {
            editTarget?.title = title
            editTarget?.context = context
            editTarget?.setValue(tags, forKey: "tags")
        }
        return self
    }
    
    func delete() {
        let realm = try! Realm()
        let deleteTarget = realm.objects(MemoDB.self).filter("id == %@", self.id)
        try! realm.write {
            realm.delete(deleteTarget)
        }
    }
    
    func realmMigration() {
        let schemaVersion: UInt64 = 4

        let config = Realm.Configuration(
            schemaVersion: schemaVersion,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < schemaVersion) {
        }})
        Realm.Configuration.defaultConfiguration = config
    }
}
