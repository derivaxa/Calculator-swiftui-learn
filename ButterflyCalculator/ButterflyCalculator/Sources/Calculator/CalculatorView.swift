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
    
    @State private var userIsTyping = false // User should be able to type more than single digit
//
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
// MARK: - Supporting methods - move these to the view model
private extension CalculatorView {
    private func tapped(number: String) {
        print("Is user typing? \(userIsTyping)")
        if (userIsTyping) {
            // TODO: Move this logic to view model & check for integer bounds
            // let minValue = Int.max
            // numbers should fit between  -2,147,483,648 and 2,147,483,647
            viewModel.displayValue = (Int(viewModel.displayValue) != 0) ? viewModel.displayValue + number : number
        } else {
            userIsTyping.toggle()
            viewModel.displayValue = number
        }
    }
    
    private func tapped(operation: String) {
        userIsTyping.toggle()
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
            .previewDevice(PreviewDevice(rawValue: "iPhone XS"))
            .previewDisplayName("iPhone XS")
    }
}

