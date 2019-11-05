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
            keyboard.frame(width: UIScreen.main.bounds.width)
        }
    }
}

#if DEBUG
struct CalculatorBrainView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ContentSizeCategory.allCases, id: \.self) { item in
            CalculatorBrainView()
                .previewLayout(.sizeThatFits)
                .environment(\.sizeCategory, item)
        }
    }
}
private extension CalculatorBrainView {

    var keyboard: some View {
        let keys = viewModel.brain.operations.map {$0.key}

        return HStack {
            ForEach(keys, id:\.self) { item in
                HStack {
                    Group {
                        Button(action: {
                            print("Tapped: \(item)")
//                            self.tapped(operation: item)
                        }) {
                            Text(item)
                        }.padding(20)
                        .accentColor(.white)
                        .background(Color.orange)
                        .mask(Circle())
                    }
                }
            }
        }
    }
}
#endif
