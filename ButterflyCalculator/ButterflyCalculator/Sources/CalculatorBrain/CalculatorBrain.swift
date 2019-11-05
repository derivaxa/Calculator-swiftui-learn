//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by 马红奇 on 2019/6/6.
//  Copyright © 2019 NSHotchner. All rights reserved.
//  Referenced from https://github.com/hotchner/SwiftUICalculator/blob/master/Calculator/Calculator/CalculatorBrain.swift

import Foundation

/// The main operator view to calculate our results
struct CalculatorBrain {
    
    /// Stores current result of total calculation
    private var accumulator: Double?
    
    /// State if a binary operation is currently in use
    private var pendingBinaryOperation: PendingBinaryOperation?

    /// Type inferencing of opertions
    private enum Operation {
        case constant(Double)
        case unary((Double) -> Double)
        case binary((Double,Double) -> Double)
        case equals
        case clear
    }
    
    /// Error cases for testing purposes
    enum CalculatorBrainError: Error {
        case wrongOperation(String)
    }
    
    
    // private extensible dictionary of operations with closures
    private var operations: Dictionary<String,Operation> = [
//        "π" : Operation.constant(Double.pi),
//        "e" : Operation.constant(M_E),
        "AC": Operation.clear,
        "√" : Operation.unary(sqrt),
//        "cos" : Operation.unary(cos),
        "±" : Operation.unary({ -$0 }),
        "×" : Operation.binary({ $0 * $1 }),
        "÷" : Operation.binary({ $0 / $1 }),
        "+" : Operation.binary({ $0 + $1 }),
        "−" : Operation.binary({ $0 - $1 }),
        "=" : Operation.equals
    ]
    
    /// Holds main logic of the program
    ///
    /// May throw error if operation or operand does not exist
    ///
    /// - Parameter symbol: All operand and operation symbols
    mutating func performOperation(_ symbol: String) throws {
        guard let operation = operations[symbol] else {
            throw CalculatorBrainError.wrongOperation(symbol)
        }
        switch operation {
        case .constant(let value):
            accumulator = value
        case .unary(let f):
            if accumulator != nil {
                accumulator = f(accumulator!)
            }
        case .binary(let f):
            if accumulator != nil {
                pendingBinaryOperation = PendingBinaryOperation(function: f, firstOperand: accumulator!)
                accumulator = nil
            }
        case .equals:
            performPendingBinaryOperation()
        case .clear:
            setOperand(0.0)
        }
    }
    
    // MARK: - Manages binary operations
    mutating func performPendingBinaryOperation() {
        if pendingBinaryOperation != nil && accumulator != nil {
            accumulator = pendingBinaryOperation!.perform(with: accumulator!)
            pendingBinaryOperation = nil
        }
    }
        
    private struct PendingBinaryOperation {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        
        /// - Return: Value from completing a binary operation
        /// - Parameter secondOperand: The last inputted value
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    /// Mutates the result property
    ///
    /// - Parameter operand: The value to operate on
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    /// - Return: Optional as accumulator can be nil
    var result: Double? {
        get {
            return accumulator
        }
    }
}
