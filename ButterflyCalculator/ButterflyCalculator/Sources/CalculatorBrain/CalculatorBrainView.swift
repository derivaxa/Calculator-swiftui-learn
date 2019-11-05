//
//  CalculatorBrainView.swift
//  iOS Application (main)
//
//  Created by Angela Mao on 5/11/19.
//  Copyright © 2019 Angela Mao. All rights reserved.
//

import SwiftUI

struct CalculatorBrainView: View {
    @ObservedObject var viewModel = CalculatorBrainViewModel()
    
    @State private var display = "0"
    @State private var userStillTyping = false

    var body: some View {
        VStack {
            Text("ButterflyCalculator")
                .foregroundColor(Color.gray)
            HStack {
                Spacer()
                Text(display)
                    .foregroundColor(Color.white)
            }
            keyboard
        }
    }
}

struct CalculatorBrainView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorBrainView().previewLayout(.sizeThatFits)

    }
}
private extension CalculatorBrainView {
    var keyboard: some View {
        HStack {
            Text("Hello")
        }
    }
}
