//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Dongwoo Pae on 8/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {

        super.setUp()
        continueAfterFailure = false
        app.launchArguments = ["UITesting"]
        app.launch()
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
