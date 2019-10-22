//
//  ButterflyCalculatorTests.swift
//  ButterflyCalculatorTests
//
//  Created by Angela Mao on 21/10/19.
//  Copyright © 2019 Angela Mao. All rights reserved.
//

import XCTest
@testable import ButterflyCalculator

class ButterflyCalculatorTests: XCTestCase {
    
    let view = CalculatorViewModel()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // MARK: - Simple calculation tests
    func testSuccessModelView() {
        XCTAssertEqual(view.displayValue, 0)
    }
    
    func testSuccessAddition() {
        XCTAssertEqual(view.addition(view.displayValue + 20), 20)
    }
    
    func testFailureAddition() {
        XCTAssertNotEqual(view.addition(view.displayValue + 20), 10)
    }
    
}
