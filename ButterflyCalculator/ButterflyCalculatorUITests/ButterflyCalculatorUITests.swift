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
    
    

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}

extension ButterflyCalculatorUITests {
    
    /// Simple test to check if user can type more than a single digit
    func testSuccessBigNumber() {
        let app = XCUIApplication()
        app.launch()
        if let number = app.staticTexts["displayValue"].value as? Int {
            XCTAssertEqual(Int(number), 0)
        }
        reversePressNumbers(app)
        if let number = app.staticTexts["displayValue"].value as? Int {
            XCTAssertEqual(Int(number), 987654321)
        }
    }
    
    /// Simple test to check that addition works when button is pressed
    func testSuccessAddition() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.staticTexts["1"].tap()
        if let number = app.staticTexts["displayValue"].value as? Int {
            XCTAssertEqual(Int(number), 1)
        }
        app.staticTexts["+"].tap()
        app.staticTexts["3"].tap()
        if let number = app.staticTexts["displayValue"].value as? Int {
            XCTAssertEqual(Int(number), 4)
        }
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    /// Simple test to check all keyboard numbers can be tapped
    func testSuccessInitNumbers() {
        // TODO: Create a cleaner testing suite
        let app = XCUIApplication()
        app.launch()
        reversePressNumbers(app)
    }
    
    fileprivate func reversePressNumbers(_ app: XCUIApplication) {
        app.staticTexts["9"].tap()
        app.staticTexts["8"].tap()
        app.staticTexts["7"].tap()
        app.staticTexts["6"].tap()
        app.staticTexts["5"].tap()
        app.staticTexts["4"].tap()
        app.staticTexts["3"].tap()
        app.staticTexts["2"].tap()
        app.staticTexts["1"].tap()
    }
}
