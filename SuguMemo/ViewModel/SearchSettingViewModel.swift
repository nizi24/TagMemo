//
//  SearchSettingViewModel.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/12.
//

import Foundation

class SearchSettingViewModel: ObservableObject {
    var searchType: [SearchType] {
        get {
            Setting().getSetting().searchType
        }
        set {
            let setting = Setting()
            setting.searchType = newValue
            setting.update()
        }
    }
    @Published var title: Bool = Setting().getSetting().searchType.contains(.title) {
        didSet {
            if title {
                searchType.append(.title)
            } else {
                searchType = searchType.filter { $0 != .title }
            }
        }
    }
    @Published var context: Bool = Setting().getSetting().searchType.contains(.context) {
        didSet {
            if context {
                searchType.append(.context)
            } else {
                searchType = searchType.filter { $0 != .context }
            }

        }
    }
    @Published var tag: Bool = Setting().getSetting().searchType.contains(.tags) {
        didSet {
            if tag {
                searchType.append(.tags)
            } else {
                searchType = searchType.filter { $0 != .tags }
            }
        }
    }
}
