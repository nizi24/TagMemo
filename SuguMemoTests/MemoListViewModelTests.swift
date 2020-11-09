//
//  MemoListViewModelTests.swift
//  SuguMemoTests
//
//  Created by Yuu Nishida on 2020/11/08.
//

import Foundation
import XCTest
@testable import SuguMemo

class MemoListViewModelTests: XCTestCase {
    
    func testGetAllInRealmReturnMemoArray() {
        let memoListViewModel = MemoListViewModel(memodb: MemoDBMock())
        XCTAssertEqual(memoListViewModel.memoList[0].title, "test1")
        XCTAssertEqual(memoListViewModel.memoList[1].context, "bar")
    }
}
