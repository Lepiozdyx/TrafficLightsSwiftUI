//
//  LightSectionView.swift
//  TrafficLightsSwiftUI
//
//  Created by Alex on 08.06.2023.
//

import SwiftUI

struct LightSectionView: View {
    let color: Color
    let text: String
    let opacity: Double
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(color)
                .opacity(opacity)
                .frame(width: 150)
                .overlay(Circle().stroke(lineWidth: 1))
                .shadow(color: color, radius: 20)
            Text(text)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        
    }
}

struct LightSectionView_Previews: PreviewProvider {
    static var previews: some View {
        LightSectionView(color: .green, text: "GO", opacity: 1)
    }
}
