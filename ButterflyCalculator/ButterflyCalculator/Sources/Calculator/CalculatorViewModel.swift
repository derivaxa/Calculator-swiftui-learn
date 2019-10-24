//
//  CalculatorModelView.swift
//  ButterflyCalculator
//
//  Created by Angela Mao on 21/10/19.
//  Copyright © 2019 Angela Mao. All rights reserved.
//

import SwiftUI
import Combine

/// ViewModel that stores the current state of the CalculatorView
class CalculatorViewModel: ObservableObject, Identifiable {
    
    // TODO: Create a way to allow operations to change and the display will automatically update
    // TODO: Display value should remember the last value in userDefaults when app start up
    @Published var displayValue = "0"
    /// dataSource is often the model for MVVM - this model is not needed as we have no objects to instantiate
    
    var keypad =  [["7","8","9"],["4","5","6"],["1","2","3"]]
    var operations = ["+","=","-","*","/"]
    
    // TODO: Create a type checking function to ensure we are printing out the right type (e.g. 3/2 = 1.5)
    
    /// - Parameter: integer to increment
    /// - Return: display + number
//
//    func addition(_ number: Int) -> Int {
//        // FIXME: Handle floating point numbers
//        if let val = Int(displayValue)
//
//        return (Int(displayValue) ?? 0) &+ number
//    }
}
