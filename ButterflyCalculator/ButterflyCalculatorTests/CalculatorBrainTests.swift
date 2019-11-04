//
//  CalculatorBrainTests.swift
//  iOS Application Unit Tests
//
//  Created by Angela Mao on 4/11/19.
//  Copyright © 2019 Angela Mao. All rights reserved.
//

import XCTest

@testable import ButterflyCalculator

class CalculatorBrainTests: XCTestCase {

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
//
//    func testSuccessAddition() {
//        brain.performOperation("1 + 2")
//        if let res = brain.result {
//            XCTAssertEqual(res, 3)
//        }
//    }
//
//    func testFailAddition() {
//        brain.performOperation("20 + 3")
//        if let res = brain.result {
//            XCTAssertNotEqual(res, 150)
//        }
//    }
//
//    func testSuccessCosOperation() {
//        brain.setOperand(Double(0))
//        brain.performOperation("cos")
//        if let res = brain.result {
//            XCTAssertEqual(res, Double(1.0))
//        }
//    }
    
    func testSuccessWrongOperation() {
        XCTAssertThrowsError(try brain.performOperation("sin")) { (error) in
            XCTAssertTrue(error is CalculatorBrain.CalculatorBrainError)
        }
    }

}
