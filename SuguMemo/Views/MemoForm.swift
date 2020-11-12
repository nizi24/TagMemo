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
    @State var tagName = ""
    @Binding var tags: [Tag]
    
    var body: some View {
        VStack {
            TextField("タイトル", text: $title)
                .padding()
            Divider()
            HStack {
                TextField("タグ", text: $tagName)
                    .padding()
                Button(action: {
                    guard MemoValidation().validationTagName(tagName) else {
                        return
                    }
                    let tag = Tag()
                    tag.name = self.tagName
                    tags.append(tag)
                    tagName = ""
                }, label: {
                    Image(systemName: "plus")
                })
                .padding()
            }
            HStack {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0..<tags.count, id: \.self) { i in
                            HStack {
                                Text(tags[i].name)
                                Button(action: {
                                    tags = tags.filter { $0.id != tags[i].id }
                                }, label: {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .frame(width: 10, height: 10)
                                })
                            }
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.black)
                            )
                        }
                    }
                }
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
            Divider()
            TextEditor(text: $context)
                .padding(.leading, 10)
                .padding(.top, 5)
                .padding(.trailing, 10)
        }
    }
}

struct MemoForm_Previews: PreviewProvider {
    static var previews: some View {
        MemoForm(title: .constant("test"), context: .constant("foobar"), tags: .constant([Tag()]))
    }
}
