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

    init(action: @escaping() -> Void, @ViewBuilder content: () -> T) {
        self.action = action
        self.content = content()
    }
    
    var body: some View {
        Button(action: action) {
            content.padding(20.0)
            .foregroundColor(.white)
            .background(Color.purple)
            .mask(Circle())
        }
    }
}

struct PurpleButtons: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(20.0)
            .foregroundColor(.white)
            .background(Color.purple)
            .mask(Circle())
    }
}

struct PinkButtons: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(20.0)
            .foregroundColor(.white)
            .background(Color.pink)
            .mask(Circle())
    }
}

struct GrayButtons: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(20.0)
            .foregroundColor(.white)
            .background(Color.gray)
            .mask(Circle())
    }
}
