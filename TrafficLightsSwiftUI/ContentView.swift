//
//  ContentView.swift
//  TrafficLightsSwiftUI
//
//  Created by Alex on 08.06.2023.
//

import SwiftUI

struct ContentView: View {

    @State private var startButtonText = "START"
    @State private var currentLight: CurrentLight = .red
    @State private var redOpacity = 0.3
    @State private var yellowOpacity = 0.3
    @State private var greenOpacity = 0.3
    
    var body: some View {
        VStack {
            LightSectionView(color: .red, text: "STOP", opacity: redOpacity)
            LightSectionView(color: .yellow, text: "WAIT", opacity: yellowOpacity)
            LightSectionView(color: .green, text: "GO", opacity: greenOpacity)
            Spacer()
            
            Button(action: pressingButton) {
                Text(startButtonText)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
                .frame(width: 200.0, height: 50.0)
                .background(.blue)
                .clipShape(Capsule())
        }
        .padding()
    }
    
    private func pressingButton() {
        if startButtonText == "START" {
            startButtonText = "NEXT"
        }
        
        withAnimation {
            switch currentLight {
            case .red:
                greenOpacity = 0.3
                redOpacity = 1
                currentLight = .yellow
            case .yellow:
                redOpacity = 0.3
                yellowOpacity = 1
                currentLight = .green
            case .green:
                yellowOpacity = 0.3
                greenOpacity = 1
                currentLight = .red
            }
        }
    }
    
}

extension ContentView {
    private enum CurrentLight {
        case red, yellow, green
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
