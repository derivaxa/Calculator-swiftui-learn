//
//  CalculatorBrainView.swift
//  iOS Application (main)
//
//  Created by Angela Mao on 5/11/19.
//  Copyright © 2019 Angela Mao. All rights reserved.
//
// Reference: https://github.com/hotchner/SwiftUICalculator/blob/master/Calculator/Calculator/Calculator.swift

import SwiftUI


/// The main calculator view with display value and keyboard
struct CalculatorBrainView: View {
    
    // State lets all references know that this variable has been updated
    @State private var brain = CalculatorBrain()
    @State private var display = "0"
    @State private var userIsInTheMiddleOfTyping = false
    
    // Keypad Buttons
    let topSymbols = ["AC", " ","√"]
    let sideSymbols = ["×", "÷", "+","−","="]
    let numbers = [["7","8","9"],["4","5","6"],["1","2","3"]]
    
    var body: some View {
        return VStack {
            displayValue
            HStack(spacing: 0.0) {
                VStack (spacing: 0.0) {
                    calculatorPad.layoutPriority(1.0)
                }
                displaySidePad
            }
        }
        
    }
}

#if DEBUG
struct CalculatorBrainView_Previews: PreviewProvider {
    static var previews: some View {
//        ForEach(ContentSizeCategory.allCases, id: \.self) { item in
        CalculatorBrainView()
            .previewLayout(.sizeThatFits)
//                .environment(\.sizeCategory, item)
//        }
    }
}
// MARK:- Actions
private extension CalculatorBrainView {
    private func touchUpInside(_ symbol: String) {
        if Int(symbol) != nil || symbol == "." {
            touchDigit(symbol)
        } else if symbol == "AC" {
            display = "0"
            performOperation(symbol)
        } else {
            performOperation(symbol)
        }
    }
    
    private func touchDigit(_ digit: String) {
        if userIsInTheMiddleOfTyping {
            display += digit
        } else {
            display = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    private func performOperation(_ symbol: String) {
        if userIsInTheMiddleOfTyping {
            do {
                brain.setOperand(Double(display)!)
                userIsInTheMiddleOfTyping.toggle()
                try brain.performOperation(symbol)
            } catch let error {
                print(error)
            }
            
            
            if let result = brain.result {
                display = String(result)
            }
        }
    }
}

// MARK:- Subviews
// FIXME: Better spacing, styling and reusability using Styles.swift & GeometryReader (similar to Cartography)
private extension CalculatorBrainView {
    
    var displayValue: some View {
        return
            HStack {
                Spacer()
                Text(display)
                    .foregroundColor(Color.white)
            }
    }
    
    var calculatorPad: some View {
        return VStack (spacing: 10.0){
            topSymbolsPad
            numberPad
        }
    }
    
    var displaySidePad: some View {
        return VStack(spacing: 10.0) {
            ForEach(sideSymbols, id:\.self) { item in
                Button(action: {
                    self.touchUpInside(item)
                }) {
                    Text(item)
                }.padding(20)
                    .accentColor(.white)
                    .background(Color.orange)
                    .mask(Circle())
            }
        }
    }
    
    /// AC, +/- & √ operations
    var topSymbolsPad: some View {
        return HStack {
            ForEach(topSymbols, id:\.self) { item in
                Button(action: {
                    self.touchUpInside(item)
                }) {
                    Text(item).frame(minWidth: 0, maxWidth: .infinity)
                }.padding(20)
                    .accentColor(.white)
                    .background(Color.pink)
                    .mask(Circle())
            }
        }
    }
    
    /// 1-9 numbers
    var numberPad: some View {
        return HStack {
            VStack(spacing: 10.0) {
                Group {
                    ForEach(numbers, id:\.self) { row in
                        HStack {
                            ForEach(row, id: \.self) { button in
                                Button(action: {
                                    self.touchUpInside(button)
                                }) {
                                    Text(button)
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                }.padding(20)
                                    .accentColor(.white)
                                    .background(Color.gray)
                                    .mask(Circle())
                            }
                        }
                    }
                }
                Group {
                    HStack(alignment: .center) {
                        Button(action: {
                            self.touchUpInside("0")
                        }) {
                            Text("0")
                                .frame(minWidth: 0, maxWidth: .infinity)
                        }.padding(20)
                            .accentColor(.white)
                            .background(Color.gray)
                            .cornerRadius(50.0)
                            .layoutPriority(2.0)
                        Button(action: {
                            self.touchUpInside(".")
                        }) {
                            Text(".")
                                .frame(minWidth: 0, maxWidth: .infinity)
                        }.padding(20)
                            .accentColor(.white)
                            .background(Color.gray)
                            .mask(Circle())
                            .layoutPriority(2.0)
                    }
                }
            }
        }
    }
}
#endif
