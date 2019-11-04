//
//  ButterflyCalculatorTests.swift
//  ButterflyCalculatorTests
//
//  Created by Angela Mao on 21/10/19.
//  Copyright © 2019 Angela Mao. All rights reserved.
//

import XCTest
import Combine

@testable import ButterflyCalculator

class ButterflyCalculatorTests: XCTestCase {
    
    var brain = CalculatorBrain()
        
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
    
    func testOperation() {
        brain.performOperation("1 + 2")
        if let res = brain.result {
            XCTAssertEqual(res, 3)
        }
    }
    
    func
    
    
//    // MARK: - Simple calculation tests
//    func testSuccessModelView() {
//        XCTAssertEqual(view.displayValue, 0)
//    }
//
//    func testEmptyValue() {
//         XCTAssertNotNil(view.displayValue)
//    }
//
//    func testSuccessAddition() {
//        XCTAssertEqual(view.addition(view.displayValue + 20), 20)
//    }
//
//    func testSuccessOverflowAddition() {
//        view.addition(1)
//        XCTAssertNoThrow(view.addition(Int.max))
//    }
//
//    func testFailureAddition() {
//        XCTAssertNotEqual(view.addition(view.displayValue + 20), 10)
//    }
}
