//
//  Canvas.swift
//  iOS Application (main)
//
//  Created by Angela Mao on 5/11/19.
//  Copyright © 2019 Angela Mao. All rights reserved.
//


import SwiftUI

// MARK: Canvas
/// A top level view with a background
struct Canvas: View {
    
    
    var body: some View {
        VStack {
            CalculatorBrainView().padding(20.0)
            Spacer()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct Canvas_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Canvas()
                .previewDevice("iPhone 7")
            Canvas()
                .previewDevice("iPhone SE")
            Canvas()
                .previewDevice("iPhone XR")
        }
    }
}

extension Canvas {
    var __preview__body: some View {
        Text("hello")
    }
}
