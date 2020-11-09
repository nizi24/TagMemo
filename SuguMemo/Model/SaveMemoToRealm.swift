//
//  SaveMemoToRealm.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/07.
//

import Foundation
import RealmSwift

class SaveMemoToRealm {
    var memo: MemoDB

    init(memo: MemoDB) {
        self.memo = memo
    }

    func saveToRealm() {
        let realm = try! Realm()
        try! realm.write() {
            realm.add(self.memo)
        }
    }
    
    
}
