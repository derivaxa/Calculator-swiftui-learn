//
//  CalculatorView.swift
//  ButterflyCalculator
//
//  Created by Angela Mao on 21/10/19.
//  Copyright © 2019 Angela Mao. All rights reserved.
//

import SwiftUI

/// The main calculator view with display value and keyboard
struct CalculatorView: View {
    @ObservedObject var viewModel = CalculatorViewModel()
    @State private var currentNumber = 0 // Recommended to have states private
    
    init(_ viewModel: CalculatorViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        return VStack {
            Text(String(viewModel.displayValue)).accessibility(identifier: "displayValue")
            VStack{
                numbersSection
            }
        }
    }
}
private extension CalculatorView {
    var numbersSection: some View {
        ForEach(viewModel.dataSource, id: \.self) { number in
            HStack {
                // All containers in SwiftUI cannot have more than 10 children,
                // Therefore, we use a group
                Group {
                    Text(String(number))
                    .frame(width: 250)
                    .background(Color.blue)
                        .mask(Circle()).onTapGesture {
                            self.viewModel.displayValue += number
                    }
                }
            }
        }
    }
}
