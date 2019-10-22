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
    
    init(_ viewModel: CalculatorViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        // TODO: Add ability to create sections of the view to create subsections of the keyboard
        return VStack {
            Text(String(viewModel.displayValue)).accessibility(identifier: "displayValue")
            VStack{
                ForEach(viewModel.dataSource, id: \.self) { number in
                    HStack {
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
        // TODO: Create a dummy button
        
    }
}
