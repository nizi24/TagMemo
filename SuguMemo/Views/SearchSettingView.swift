//
//  SearchSettingView.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/12.
//

import SwiftUI

struct SearchSettingView: View {
    @ObservedObject var viewModel = SearchSettingViewModel()
    
    var body: some View {
        Form {
            Section(header: Text("検索対象")) {
                Toggle(isOn: $viewModel.title, label: {
                    Text("タイトル")
                })
                Toggle(isOn: $viewModel.context, label: {
                    Text("メモの内容")
                })
                Toggle(isOn: $viewModel.tag, label: {
                    Text("タグ")
                })
            }
            .padding(.top, 10)
        }
        .navigationBarTitle(Text("検索設定"), displayMode: .inline)
    }
}

struct SearchSettingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchSettingView()
        }
    }
}
