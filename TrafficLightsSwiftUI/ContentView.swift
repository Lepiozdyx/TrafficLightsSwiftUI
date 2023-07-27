//
//  ContentView.swift
//  TrafficLightsSwiftUI
//
//  Created by Alex on 08.06.2023.
//

import SwiftUI

struct ContentView: View {

    @State private var startButtonText = "START"
    @State private var currentLight: CurrentLight = .off
    
    var body: some View {
        VStack {
            LightSectionView(
                color: .red,
                text: "STOP",
                opacity: currentLight == .red ? 1 : 0.3
            )
            LightSectionView(
                color: .yellow,
                text: "WAIT",
                opacity: currentLight == .yellow ? 1 : 0.3
            )
            LightSectionView(
                color: .green,
                text: "GO",
                opacity: currentLight == .green ? 1 : 0.3
            )
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
            case .off: currentLight = .red
            case .red: currentLight = .yellow
            case .yellow: currentLight = .green
            case .green: currentLight = .red
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    private enum CurrentLight {
        case off, red, yellow, green
    }
}
