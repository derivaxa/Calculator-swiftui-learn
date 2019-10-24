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
    // Note: Dependency injection will help with creating the mocking view
    @ObservedObject var viewModel = CalculatorViewModel()
    
    @State private var userIsTyping = false // User should be able to type more than single digit
    @State private var currentNumber = "0" // Recommended to have states private
    
    init(_ viewModel: CalculatorViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text(String(self.currentNumber))
                .accessibility(identifier: "displayValue")
            VStack(alignment: .leading, spacing: .none, content: {
                numbersSection
            })
            VStack {
                operationsSection
            }
        }
    }
}

// MARK: - Subsections of the calculator view
private extension CalculatorView {
    // Number parser
    var numbersSection: some View {
        ForEach(viewModel.keypad, id: \.self) { row in
            HStack {
                // All containers in SwiftUI cannot have more than 10 children,
                // Therefore, we use a group
                ForEach(row, id: \.self) { number in
                    VStack {
                        Group {
                            Button(action: {
                                self.tapped(number: number)
                                print("Tapped: \(number)")
                            }) {
                                Text(String(number))
                            }
                                // TODO: Reuse this section of styling across the app
                            .padding(20)
                            .accentColor(.white)
                            .background(Color.blue)
                            .mask(Circle())
                        }
                    }
                }
            }
        }
    }
    

    // Main arithmetic operations parser
    var operationsSection: some View {
        ForEach(viewModel.operations, id:\.self) { item in
            HStack {
                Group {
                    Button(action: {
                        print("Tapped: \(item)")
                        self.tapped(operation: item)
                    }) {
                        Text(item)
                    }
                }
            }
        }
    }
}
// MARK: - Supporting methods
private extension CalculatorView {
    private func tapped(number: String) {
        print("Is user typing? \(userIsTyping)")
        if (userIsTyping) {
            // TODO: Move this logic to view model & check for integer bounds
            // let minValue = Int.max
            // numbers should fit between  -2,147,483,648 and 2,147,483,647
            currentNumber = (Int(currentNumber) != 0) ? currentNumber + number : number
        } else {
            userIsTyping = true
            currentNumber = number
        }
    }
    
    private func tapped(operation: String) {
        userIsTyping = false
    }
}
