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
    @State private var userIsTyping = false
    
    //    init(_ viewModel: CalculatorViewModel) {
    //        self.viewModel = viewModel
    //    }
    
    var body: some View {
        return
            VStack(alignment: .trailing) {
                Text(viewModel.displayValue)
                    .accessibility(identifier: "displayValue")
                    .font(.title)
                HStack {
                    VStack(alignment: .leading, spacing: .none, content: {
                        numbersSection
                    })
                    
                    VStack {
                        operationsSection
                    }
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
                                self.viewModel.tapped(number: number)
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
                        self.viewModel.tapped(operation: item)
                    }) {
                        Text(item)
                    }
                }
            }
        }
    }
}

