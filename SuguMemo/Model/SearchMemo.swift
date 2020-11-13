//
//  SearchMemo.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/12.
//

import Foundation
import RealmSwift

struct SearchMemo {
    var searchTypes: [SearchType] {
        get {
            return Setting().getSetting().searchType
        }
    }
    
    func searchMemo(searchWord: String) -> [MemoDB] {
        var results: [MemoDB] = []
        for searchType in searchTypes {
            switch searchType {
            case .title:
                results.append(contentsOf: searchMemoWithTitle(searchWord: searchWord))
            case .context:
                results.append(contentsOf: searchMemoWithContext(searchWord: searchWord))
            case .tags:
                results.append(contentsOf: searchMemoWithTags(searchWord: searchWord))
            }
        }
        results = results.reduce([], { $0.contains($1) ? $0 : $0 + [$1] })
        return results
    }
    
    
    
    private func resultsToMemoDBConversion(results: Results<MemoDB>) -> [MemoDB] {
        var memoDBArray: [MemoDB] = []
        for result in results {
            let memodb = result as MemoDB
            memoDBArray.append(memodb)
        }
        return memoDBArray
    }
    
    private func searchMemoWithTitle(searchWord: String) -> [MemoDB] {
        let realm = try! Realm()
        let results = realm.objects(MemoDB.self).filter("title LIKE %@", "*\(searchWord)*")
        return resultsToMemoDBConversion(results: results)
    }
    
    private func searchMemoWithContext(searchWord: String) -> [MemoDB] {
        let realm = try! Realm()
        let results = realm.objects(MemoDB.self).filter("context LIKE %@", "*\(searchWord)*")
        return resultsToMemoDBConversion(results: results)
    }
    
    private func searchMemoWithTags(searchWord: String) -> [MemoDB] {
        let realm = try! Realm()
        let tagResults = realm.objects(Tag.self).filter("name LIKE %@", "*\(searchWord)*")
        var results: [MemoDB] = []
        for tag in tagResults {
            results.append(contentsOf: tag.memos)
        }
        return results
    }

}
