//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by Eddy on 2022/04/11.
//

import XCTest
@testable import Expo1900

class Expo1900Tests: XCTestCase {
    var sut: WorldFairPoster!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_load_Json() {
        let decoder = JSONDecoder()
        guard let url = Bundle.main.url(forResource: "exposition_universelle_1900", withExtension: "json"),
              let data = try? Data(contentsOf: url)
        else {
            return
        }
        XCTAssertNoThrow(try? decoder.decode(WorldFairPoster.self, from: data))
    }
    
    func test_mock_file() {
        let decoder = JSONDecoder()
        
        guard let asset = NSDataAsset(name: "exposition_universelle_1900", bundle: .main),
            let expo = try? decoder.decode(WorldFairPoster.self, from: asset.data)
        else {
            return
        }
        XCTAssertEqual(expo.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
    }
}
