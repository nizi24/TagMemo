//
//  SwiftUIView.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/10.
//

import SwiftUI

struct EditMemoView: View {
    @ObservedObject var viewModel = CreateMemoViewModel()
    @EnvironmentObject var memoListViewModel: MemoListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("タイトル", text: $viewModel.title)
                    TextEditor(text: $viewModel.context)
                        .frame(maxWidth: .infinity)
                }
            }
            .navigationBarTitle(Text("新規作成"), displayMode: .inline)
            .navigationBarItems(trailing:
                        Button(action: {
                            do {
                                let memodb = try viewModel.saveToRealm()
                                memoListViewModel.memoList.append(Memo(id: memodb.id, context: viewModel.context, title: viewModel.title))
                                viewModel.reset()
                            } catch {
                                fatalError("メモを保存できませんでした")
                            }
                        }, label: {
                Image(systemName: "plus")
            }))
        }
    }
}

struct EditMemoView_Previews: PreviewProvider {
    static var previews: some View {
        EditMemoView()
    }
}

