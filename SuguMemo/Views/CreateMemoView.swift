//
//  CreateMemoView.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/07.
//

import SwiftUI

struct CreateMemoView: View {
    @State var title = ""
    @State var context = ""
    
    var body: some View {
        VStack {
            Form {
                TextField("タイトル", text: $title)
                TextEditor(text: $context)
                    .frame(maxWidth: .infinity)
            }
        }
        .navigationBarTitle(Text("新規作成"), displayMode: .inline)
        .navigationBarItems(trailing:
                    Button(action: {
                        
                    }, label: {
            Image(systemName: "plus")
        }))
        
    }
}

struct CreateMemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreateMemoView()
        }
    }
}
