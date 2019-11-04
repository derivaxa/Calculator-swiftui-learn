//
//  CalculatorBrainTests.swift
//  iOS Application Unit Tests
//
//  Created by Angela Mao on 4/11/19.
//  Copyright © 2019 Angela Mao. All rights reserved.
//

import XCTest

@testable import ButterflyCalculator

/// Collection of unit tests covering the functions in CalculatorBrain. These include catching errors and overflow checking.
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
    
    func testAddition() {
        do {
            brain.setOperand(Double(1.0))
            try brain.performOperation("1 + 2")
            testSuccessAddition()
            testFailAddition()
        } catch let error {
            print(error) //Good for handling any regression errors
        }
    }

    func testSuccessAddition() {
        if let res = brain.result {
            XCTAssertEqual(res, 3)
        }
    }

    func testFailAddition() {
        if let res = brain.result {
            XCTAssertNotEqual(res, 150)
        }
    }
    
    func testMultiplication() {
        do {
            try brain.performOperation("1 x 10")
            testSuccessMultiplication()
            testFailMultiplication()
            let bigInt = Int.max
            try brain.performOperation("\(bigInt)x10")
            testSuccessOverloadMultiplication()
            try brain.performOperation("0x20")
            testFailZeroMultiplication()
        } catch let error {
            print(error)
        }
    }
    
    func testSuccessMultiplication() {
        if let res = brain.result {
            XCTAssertEqual(res,10)
        }
    }
    
    func testFailMultiplication() {
        if let res = brain.result {
            XCTAssertEqual(res,200)
        }
    }
    
    func testSuccessOverloadMultiplication() {
        // TODO: Update this to reflect how the calculator would work with overload operators
        if let res = brain.result {
            print(res)
        }
    }
    
    func testFailZeroMultiplication() {
        if let res = brain.result {
            XCTAssertEqual(res,0)
        }
    }

    func testSuccessCosOperation() {
        // Given
        brain.setOperand(Double(0))
        // When
        do {
            try brain.performOperation("cos")
            if let res = brain.result {
                // Then
                XCTAssertEqual(res, Double(1.0))
            }
        } catch let error {
            print(error)
        }
    }
    
    func testSuccessWrongOperation() {
        XCTAssertThrowsError(try brain.performOperation("sin")) { (error) in
            XCTAssertTrue(error is CalculatorBrain.CalculatorBrainError)
        }
    }

}
