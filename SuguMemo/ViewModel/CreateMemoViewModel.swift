//
//  CreateMemoView.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/08.
//

import Foundation
import RealmSwift

class CreateMemoViewModel: ObservableObject {
    @Published var title = ""
    @Published var context = ""
    
    func saveToRealm() throws {
        let memodb = MemoDB()
        memodb.title = title
        memodb.context = context
        try memodb.saveToRealm()
    }
    
    func reset() {
        title = ""
        context = ""
    }
}
