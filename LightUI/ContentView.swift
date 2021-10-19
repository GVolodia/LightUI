//
//  ContentView.swift
//  LightUI
//
//  Created by noone on 19.10.2021.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State var isLightOn: Int = 1
    @State var device = AVCaptureDevice.default(for: AVMediaType.video)
    @State var buttonTitle = "Torch"
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            //depending on the value of isLightOn - changes Color
            //value is changed by onTapGuesture
            switch isLightOn {
            case 1:
                Color.red
            case 2:
                Color.yellow
            case 3:
                Color.green
            default:
                Color.red
            }
            
            Button(action: {
                if ((device?.hasTorch) != nil) {
                    
                    //checking if device has a torch
                    //and switches it on or off
                    do {
                        try device?.lockForConfiguration()
                        device?.torchMode = device?.torchMode == AVCaptureDevice.TorchMode.on ? .off : .on
                    } catch {
                        print(error)
                    }
                    device?.unlockForConfiguration()
                    
                    
                } else {print("No torch")}
                
                buttonTitle = buttonTitle == "On" ? "Off" : "On"
                
            }, label: {
                Text(buttonTitle)
            }).frame(width:50).padding(10).background(Color.black).cornerRadius(6).offset(x: 0, y: -30)
            
        }
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            changeColor()
        }.statusBar(hidden: true)
    }
    // This func changes a value of var isLightOn
    //and doesn't let it be more than 3
    func changeColor() {
        isLightOn += 1
        if isLightOn > 3 {
            isLightOn = 1
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
