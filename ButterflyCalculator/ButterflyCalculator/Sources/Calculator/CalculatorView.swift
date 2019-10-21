//
//  CalculatorView.swift
//  ButterflyCalculator
//
//  Created by Angela Mao on 21/10/19.
//  Copyright © 2019 Angela Mao. All rights reserved.
//

import SwiftUI

struct CalculatorView: View {
    @ObservedObject var viewModel = CalculatorViewModel()
    
    init(_ viewModel: CalculatorViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text(viewModel.displayValue)
        // TODO: Add ability to create sections of the view
        // TODO: Create a sample test and build test targets
        // TODO: Create a dummy button
    }
}
