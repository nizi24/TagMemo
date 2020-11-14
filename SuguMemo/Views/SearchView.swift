//
//  SearchView.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/12.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()
    @EnvironmentObject var memoListViewModel: MemoListViewModel
    @State var settingView = false
    
    var body: some View {
        VStack {
            HStack {
                TextField("検索",  text: $viewModel.searchWord)
                    .padding()
                    .onChange(of: viewModel.searchWord, perform: { value in
                        viewModel.search()
                    })
            }
            Divider()
            MemoList(memoList: $viewModel.results, results: $viewModel.results)
            Spacer()
        }
        .navigationBarTitle(Text("検索"), displayMode: .inline)
        .navigationBarItems(trailing:
            HStack {
                EditButton()
                Button(action: {
                    settingView.toggle()
                }) {
                    Image(systemName: "gearshape")
                }
            }
        )
        .sheet(isPresented: $settingView) {
            SearchSettingView()
        }
        .onAppear {
            viewModel.search()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchView()
        }
    }
}
