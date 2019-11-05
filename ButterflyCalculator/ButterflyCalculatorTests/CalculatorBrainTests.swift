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
    
    func binaryOperation(_ n1: Double,_ operation: String,_ n2: Double) {
        do {
            brain.setOperand(n1)
            try brain.performOperation(operation)
            brain.setOperand(n2)
            equalOperation()
        } catch let error {
            print(error)
        }
    }
    
    func equalOperation() {
        do {
            try brain.performOperation("=")
        } catch let error {
            print(error)
        }
    }

    func testSuccessAddition() {
        binaryOperation(Double(1.0), "+", Double(2.0))
        equalOperation()
        if let res = brain.result {
            XCTAssertEqual(res, 3)
        }
    }

    func testFailAddition() {
        binaryOperation(Double(1.0), "+", Double(2.0))
        equalOperation()
        if let res = brain.result {
            XCTAssertNotEqual(res, 150)
        }
    }
    
    func testSuccessMultiplication() {
        binaryOperation(1.0, "×", 10.0) //note: Multiplication sign is a special character
        equalOperation()
        if let res = brain.result {
            XCTAssertEqual(res, 10.0)
        }
    }
    
    func testFailMultiplication() {
        binaryOperation(1.0, "×", 10.0)
        equalOperation()
        if let res = brain.result {
            XCTAssertNotEqual(res,200)
        }
    }
    
    func testSuccessOverloadMultiplication() {
        // TODO: Update this to reflect how the calculator would work with overload operators
        let bigDouble = Double.greatestFiniteMagnitude
        binaryOperation(Double(bigDouble), "×", 2.0)
        equalOperation()
        if let res = brain.result {
            print(res)
        }
    }
    
    func testFailZeroMultiplication() {
        // FIXME: Output incorrect
        binaryOperation(Double(1.0), "×", 0.0)
        equalOperation()
        if let res = brain.result {
            XCTAssertEqual(res, 0.0)
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
