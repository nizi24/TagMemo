//
//  EditMemoViewModel.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/10.
//

import Foundation
import RealmSwift

class EditMemoViewModel: ObservableObject  {
    var id: String
    @Published var title: String {
        willSet {
            update()
        }
    }
    @Published var context: String {
        willSet {
            update()
        }
    }
    
    init(id: String, title: String, context: String) {
        self.id = id
        self.title = title
        self.context = context
    }
    
    func update() {
        let memodb = MemoDB().newMemoDB(memo: Memo(id: id, context: context, title: title))
        let updatedMemodb = memodb.update()
        EditMemoVIew(viewModel: self).updateMemoList(updatedMemodb: updatedMemodb)
    }
}
