//
//  Buttons.swift
//  iOS Application (main)
//
//  Created by Angela Mao on 23/10/19.
//  Copyright © 2019 Angela Mao. All rights reserved.
//

import SwiftUI

// TODO: Remove boilerplate code

struct CustomButton<T: View>: View {
    let action: () -> Void
    let content: T
    let color: Color

    init(action: @escaping() -> Void, @ViewBuilder content: () -> T, color: Color) {
        self.action = action
        self.content = content()
        self.color = color
    }
    
    var body: some View {
        Button(action: action) {
            content.padding(15.0)
            .foregroundColor(.white)
            .background(color)
                .cornerRadius(25.0)
        }
    }
}
