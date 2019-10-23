//
//  Buttons.swift
//  iOS Application (main)
//
//  Created by Angela Mao on 23/10/19.
//  Copyright © 2019 Angela Mao. All rights reserved.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        Button(action: {
            print("hello")
        }) {
            Text("Hello")
            
        }
    }
}


struct Buttons_Preview: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
