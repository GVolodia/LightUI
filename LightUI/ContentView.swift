//
//  ContentView.swift
//  LightUI
//
//  Created by noone on 19.10.2021.
//

import SwiftUI

struct ContentView: View {
    @State var isLightOn = true
    var body: some View {
        ZStack {
            isLightOn ? Color.white : Color.black
        }
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            isLightOn.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
