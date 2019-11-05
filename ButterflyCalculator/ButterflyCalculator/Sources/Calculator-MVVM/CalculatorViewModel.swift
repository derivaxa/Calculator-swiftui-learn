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
    
    @Published var displayValue = "0"
    
    var keypad =  [["7","8","9"],["4","5","6"],["1","2","3"]]
    var operations = ["+","-","*","/","="]
}
