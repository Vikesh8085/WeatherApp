//
//  SearchScreenTesting.swift
//  Weather AppTests
//
//  Created by macbook on 15/01/22.
//

import XCTest
@testable import Weather_App

class SearchScreenTesting: XCTestCase {

    var searchViewController: SearchViewController?
    
    
    override func setUpWithError() throws {
        configureViewController()
    }
    
    override func tearDownWithError() throws {
        searchViewController = nil
    }
    
    private func configureViewController() {
        let networkManager: NetworkManager = NetworkManager()

        searchViewController = SearchViewController(nibName: "SearchViewController", bundle: nil)
        searchViewController?.viewModel = SearchViewModel(networkManager: networkManager)
        searchViewController?.loadViewIfNeeded()
    }

    // MARK: - UI Related Unit Test

    func testViewControllerExists() {
        XCTAssertNotNil(searchViewController, "GoldHomeViewController does not exist")
    }
    
    
    func testfetcheEmptyQeryAPI(){
        
        let expectation = XCTestExpectation()
        
        searchViewController?.viewModel?.callAPIWithQuery(query: "", success: { data in
            guard let _ = data else {
                expectation.fulfill()
                return
            }
            
        }, failure: { error in
            
            if error.localizedDescription.isEmpty {
                XCTFail("Failed: Error localizedDescription Empty")
            }
            expectation.fulfill()
        })
        self.wait(for: [expectation], timeout: 5)
        
    }
    
    func testfetcheCityQeryAPI(){
        
        let expectation = XCTestExpectation()
        
        searchViewController?.viewModel?.callAPIWithQuery(query: "delhi", success: { data in
            guard let _ = data else {
                XCTFail("Data is not coming for query Delhi")
                return
            }
            expectation.fulfill()
            
        }, failure: { error in
            
            if error.localizedDescription.isEmpty {
                expectation.fulfill()
            } else {
                XCTFail("Failed: Error not empty")
            }
        })
        self.wait(for: [expectation], timeout: 5)
        
    }
    
}
