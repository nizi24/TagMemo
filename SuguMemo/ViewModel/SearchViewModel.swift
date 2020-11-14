//
//  SearchViewModel.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/12.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var searchWord = ""
    var searchType: [SearchType] {
        Setting().getSetting().searchType
    }
    @Published var results: [Memo] = []
    
    func search() {
        results = []
        guard !searchWord.isEmpty else {
            return
        }
        let resultsMemoDB = SearchMemo().searchMemo(searchWord: searchWord)
        for result in resultsMemoDB {
            let memo = Memo(id: result.id, context: result.context, tags: Array(result.tags), title: result.title)
            results.append(memo)
        }
    }
    
    func searchInMemoList(memoList: [Memo]) -> [Memo] {
        var r: [Memo] = []
        for memo in memoList {
            r = results.filter { $0.id == memo.id }
        }
        return r
    }
}
