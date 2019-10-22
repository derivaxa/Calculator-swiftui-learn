//
//  ButterflyCalculatorUITests.swift
//  ButterflyCalculatorUITests
//
//  Created by Angela Mao on 21/10/19.
//  Copyright © 2019 Angela Mao. All rights reserved.
//

import XCTest

class ButterflyCalculatorUITests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /// Simple test to check that addition works when button is pressed
    func testSuccessAddition() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.staticTexts["1"].tap()
        if let number = app.staticTexts["displayValue"].value as? Int {
            XCTAssertEqual(Int(number), 2)
        }
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    /// Simple test to check all keyboard numbers can be tapped
    func testSuccessInitNumbers() {
        // TODO: Create a cleaner testing suite
        let app = XCUIApplication()
        app.launch()
        app.staticTexts["1"].tap()
        app.staticTexts["2"].tap()
        // BUGFIX: When you add up numbers 1 + 2 there are two numbers of 3 on the screen
//        app.staticTexts["3"].tap()
        app.staticTexts["4"].tap()
        app.staticTexts["5"].tap()
        app.staticTexts["6"].tap()
        app.staticTexts["7"].tap()
        app.staticTexts["8"].tap()
        app.staticTexts["9"].tap()
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
