//
//  ContentView.swift
//  TrafficLightsSwiftUI
//
//  Created by Alex on 08.06.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            LightSectionView(color: .red, text: "STOP")
            LightSectionView(color: .orange, text: "WAIT")
            LightSectionView(color: .green, text: "GO")
            Spacer()
        }
        .padding(.top, 40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
