//
//  ContentView.swift
//  SwiftUI-Stacks
//
//  Created by Deka Primatio on 17/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // VStack Property by Alphabet
        VStack (alignment: .leading, spacing: 20) {
            Text("Hello World123")
            Text("Hello World2")
            Divider()
            Text("Hello World09090123123")
        } //: VStacks
        .padding()
        .offset(x: 30, y: 100)
        .padding(.trailing, 50)
    }
}

struct ContentView2: View {
    var body: some View {
        HStack(spacing: 20) {
            Text("1")
            Text("2")
            Text("3")
            Text("4")
            Text("5")
        }
        .font(.system(size: 50))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
