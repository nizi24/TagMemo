//
//  MemoFormViewModel.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/12.
//

import Foundation

struct MemoValidation {
    
    func validationTitle() {
    }
    
    func validationConText() {
    }
    
    func validationTagName(_ tagName: String) -> Bool {
        guard !tagName.isEmpty else {
            return false
        }
        return true
    }
}
