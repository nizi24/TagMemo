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
        didSet {
            update()
        }
    }
    @Published var context: String {
        didSet {
            update()
        }
    }
    @Published var tags: [Tag] {
        didSet {
            print(tags)
            update()
        }
    }
    
    init(id: String, title: String, context: String, tags: [Tag]) {
        self.id = id
        self.title = title
        self.context = context
        self.tags = tags
    }
    
    func update() {
        let memodb = MemoDB().newMemoDB(memo: Memo(id: id, context: context, tags: tags, title: title))
        memodb.update()
    }
}
