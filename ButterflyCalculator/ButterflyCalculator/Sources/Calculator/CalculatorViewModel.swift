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
    @Published var displayValue = "0"
}
