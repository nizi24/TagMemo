//
//  Setting.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/12.
//

import Foundation
import RealmSwift

class Setting: Object {
    var searchTypeString = List<String>()
    var searchType: [SearchType] {
        get {
            return searchTypeString.map { SearchType(rawValue: $0)! }
        }
        set {
            let newList = List<String>()
            newList.append(objectsIn: newValue.map { $0.rawValue })
            searchTypeString = newList
        }
    }
    
    override static func ignoredProperties() -> [String] {
            return ["searchType"]
    }
    
    func getSetting() -> Setting {
        let realm = try! Realm()
        let setting = realm.objects(Setting.self).first
        self.searchTypeString = setting!.searchTypeString
        return self
    }
    
    private func createSetting() {
        self.searchType = [.context, .title, .tags]
        let realm = try! Realm()
        try! realm.write() {
            realm.add(self)
        }
    }
    
    func findOrCreate() {
        if !isExist() {
            createSetting()
        }
    }
    
    func isExist() -> Bool {
        let realm = try! Realm()
        if realm.objects(Setting.self).first != nil {
            return true
        }
        return false
    }
    
    func update() {
        let realm = try! Realm()
        let editTarget = realm.objects(Setting.self).first
        try! realm.write {
            editTarget?.setValue(searchTypeString, forKey: "searchTypeString")
        }
    }
}
