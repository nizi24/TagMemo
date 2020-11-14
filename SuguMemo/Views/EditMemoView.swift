//
//  EditMemoVIew.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/10.
//

import SwiftUI

struct EditMemoVIew: View {
    @ObservedObject var viewModel: EditMemoViewModel
    @EnvironmentObject var memoListViewModel: MemoListViewModel
    
    var body: some View {
        VStack {
            MemoForm(title: $viewModel.title, context: $viewModel.context, tags: $viewModel.tags)
        }
        .navigationBarTitle(Text(viewModel.title), displayMode: .inline)
    }
}

struct EditMemoVIew_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditMemoVIew(viewModel: EditMemoViewModel(id: "", title: "test", context: "foobar", tags: [Tag()]))
        }
    }
}
