//
//  MemoListViewModel.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/08.
//

import Foundation
import Combine
import RealmSwift

class MemoListViewModel: ObservableObject {
    @Published var memoList: [Memo] = [] {
        willSet {
            print(memoList)
        }
    }
    
    init(memodb: MemoDBProtocol = MemoDB()) {
        self.getAllInRealm(memodb: memodb)
    }
        
    func getAllInRealm(memodb: MemoDBProtocol) {
        guard let result = memodb.getAll() else {
            return
        }
        for memodb in result {
            let memo = Memo(context: memodb.context, title: memodb.title)
            self.memoList.append(memo)
        }
    }
}
