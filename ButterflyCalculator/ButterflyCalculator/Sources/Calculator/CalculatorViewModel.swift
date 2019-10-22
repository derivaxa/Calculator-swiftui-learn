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
    // TODO: Display value should remember the last value in userDefaults when app start up
    
    @Published var displayValue = 0
    /// dataSource is often the model for MVVM
    var dataSource = [1,2,3,4,5,6,7,8,9]
    
    /// - Parameter: integer to increment
    /// - Return: display + number
    func addition(_ number: Int) -> Int {
        // FIXME: Handle floating point numbers
        // FIXME: Handle bounds of integers
        displayValue += number
        return displayValue
    }
}
