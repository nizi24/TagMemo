//
//  MemoFormViewModel.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/12.
//

import Foundation

struct MemoValidation {
    
    func validationConText(_ context: String) -> Bool {
        guard !context.isEmpty else {
            return false
        }
        return true
    }
    
    func validationTagName(_ tagName: String) -> Bool {
        guard !tagName.isEmpty else {
            return false
        }
        return true
    }
}
