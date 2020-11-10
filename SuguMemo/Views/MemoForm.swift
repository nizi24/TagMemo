//
//  MemoForm.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/10.
//

import SwiftUI

struct MemoForm: View {
    @Binding var title: String
    @Binding var context: String
    
    var body: some View {
        Form {
            TextField("タイトル", text: $title)
            TextEditor(text: $context)
                .frame(maxWidth: .infinity)
        }
    }
}
