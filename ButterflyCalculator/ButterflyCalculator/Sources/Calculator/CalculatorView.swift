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
            VStack(alignment: .center, spacing: .none, content: {
                numbersSection
            })
        }
    }
}
// MARK: - Subsections of the calculator view
private extension CalculatorView {
    var numbersSection: some View {
        ForEach(viewModel.dataSource, id: \.self) { row in
            HStack {
                // All containers in SwiftUI cannot have more than 10 children,
                // Therefore, we use a group
                ForEach(row, id: \.self) { number in
                    VStack {
                        Group {
                            Button(action: {
                                self.viewModel.displayValue += Int(number) ?? 0
                            }) {
                                Text(String(number))
                            }.frame(minWidth: .zero, maxWidth: .infinity, minHeight: .zero, maxHeight: .infinity)
                                .accentColor(.white)
                                .background(Color.blue).padding(.all)
                        }.mask(Circle())

                    }
                }
            }
        }
    }
}
// MARK: - Supporting methods
private extension CalculatorView {
    
}
