//
//  CalculatorBrainView.swift
//  iOS Application (main)
//
//  Created by Angela Mao on 5/11/19.
//  Copyright © 2019 Angela Mao. All rights reserved.
//

import SwiftUI


/// The main calculator view with display value and keyboard
struct CalculatorBrainView: View {
    
    // Keeps track of our viewModel
    @ObservedObject var viewModel = CalculatorBrainViewModel()
    
    // State lets all references know that this variable has been updated
    @State private var display = "0"
    @State private var userStillTyping = false
    
    // Buttons
    let topSymbols = ["AC", "\u{207A}\u{2215}\u{208B}","√"]
    let sideSymbols = ["×", "÷", "+","−","="]
    let numbers = [["7","8","9"],["4","5","6"],["1","2","3"]]
    
    var body: some View {
        VStack {
            displayValue
            HStack {
                VStack {
                    calculatorPad
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
private extension CalculatorBrainView {
    
    var displayValue: some View {
        return Text("ButterflyCalculator")
            .foregroundColor(Color.gray)
        HStack {
            Spacer()
            Text(display)
                .foregroundColor(Color.white)
        }
    }
    
    var calculatorPad: some View {
        return VStack {
            topSymbolsPad
            numberPad
        }
    }
    
    var displaySidePad: some View {
        return VStack {
            ForEach(sideSymbols, id:\.self) { item in
                Button(action: {
                    print("Tapped: \(item)")
                }) {
                    Text(item).frame(minWidth: 0, maxWidth: .infinity)
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
                    print("Tapped: \(item)")
                }) {
                    Text(item).frame(minWidth: 0, maxWidth: .infinity)
                }.padding(20)
                    .accentColor(.white)
                    .background(Color.orange)
                    .mask(Circle())
            }
        }
    }
    
    /// 1-9 numbers
    var numberPad: some View {
        return HStack {
            VStack {
                Group {
                    ForEach(numbers, id:\.self) { row in
                        HStack {
                            ForEach(row, id: \.self) { button in
                                Button(action: {
                                    print("Tapped: \(button)")
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
                            print("Tapped: 0")
                        }) {
                            Text("0")
                                .frame(minWidth: 0, maxWidth: .infinity)
                        }.padding(20)
                            .accentColor(.white)
                            .background(Color.gray)
                            .cornerRadius(50.0)
                            .layoutPriority(2.0)
                        Button(action: {
                            print("Tapped: .")
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
