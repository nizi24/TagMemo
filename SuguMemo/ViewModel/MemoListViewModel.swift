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
    @Published var memoList: [Memo] = []
    init(memodb: MemoDBProtocol = MemoDB()) {
        self.getAllInRealm(memodb: memodb)
    }
        
    func getAllInRealm(memodb: MemoDBProtocol) {
        guard let result = memodb.getAll() else {
            return
        }
        for memodb in result {
            let memo = Memo(id: memodb.id, context: memodb.context, title: memodb.title)
            self.memoList.append(memo)
        }
    }
    
    func deleteMemo(targetMemo: Memo)  {
        memoList = memoList.filter { $0.id != targetMemo.id }
        let memodb = MemoDB().newMemoDB(memo: targetMemo)
        memodb.delete()
    }
}
