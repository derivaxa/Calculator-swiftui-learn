//
//  CalculatorModelView.swift
//  ButterflyCalculator
//
//  Created by Angela Mao on 21/10/19.
//  Copyright © 2019 Angela Mao. All rights reserved.
//

import SwiftUI
import Combine

class CalculatorViewModel: ObservableObject, Identifiable {
    // TODO: Display value should remember the last value in userDefaults when app start up
    @Published var displayValue = 0
    // Decision: For MVVM - this would connect to a model which handles our data
    @Published var dataSource = [1,2,3,4,5,6,7,8,9]
}
