//
//  CreateMemoView.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/07.
//

import SwiftUI
import RealmSwift

struct CreateMemoView: View {
    @State var contextInValid = false
    @ObservedObject var viewModel = CreateMemoViewModel()
    @ObservedObject var keyboardObserver = KeyboardObserver()
    @EnvironmentObject var memoListViewModel: MemoListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                MemoForm(title: $viewModel.title, context: $viewModel.context, tags: $viewModel.tags)
            }
            .navigationBarTitle(Text("新規作成"), displayMode: .inline)
            .navigationBarItems(trailing:
                        Button(action: {
                            guard MemoValidation().validationConText(viewModel.context) else {
                                self.contextInValid = true
                                return
                            }
                            do {
                                let memodb = try viewModel.saveToRealm()
                                memoListViewModel.memoList.append(Memo(id: memodb.id, context: viewModel.context, tags: viewModel.tags, title: viewModel.title))
                                viewModel.reset()
                            } catch {
                                fatalError("メモを保存できませんでした")
                            }
                        }, label: {
                Image(systemName: "plus")
            }))
            .alert(isPresented: $contextInValid) {
                Alert(title: Text("エラー"), message: Text("メモが入力されていません"), dismissButton: .cancel())
            }
        }
        .onAppear{
            keyboardObserver.addObserver()
        }.onDisappear {
            keyboardObserver.removeObserver()
        }.onTapGesture {
            if keyboardObserver.isShowing {
                UIApplication.shared.endEditing()
            }
        }
    }
}

struct CreateMemoView_Previews: PreviewProvider {
    static var previews: some View {
        CreateMemoView()
    }
}
