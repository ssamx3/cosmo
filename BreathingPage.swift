//
//  SwiftUIView.swift
//  cosmo
//
//  Created by sam on 07/02/2025.
//

import SwiftUI

struct BreathingPage: View {
    
    
    // Variables --------------
    @State public var scale: CGFloat = 0.5
    @State public var stage = 0
    @State public var breathingText = "Breathe In..."
    let breathingTextList = ["Breathe In...", "Hold...", "Breathe Out...", "Hold..."]
    let scales = [0.8, 0.8, 0.5, 0.5]
    let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    // Variables ---------
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                if #available(iOS 18.0, *) {
                    Circle()
                        .scale(scale + 0.2 )
                        .opacity(0.5)
                        .foregroundStyle(
                            MeshGradient(width: 2, height: 2, points: [[0,0], [0,1], [1,0], [1,1]], colors:[ .black, .accentColor,. pink, .blue]))
                } else {}
                
                
                if #available(iOS 18.0, *) {
                    Circle()
                        .scale(scale)
                        .sensoryFeedback(.impact(flexibility: .soft, intensity: 2.5), trigger: stage)
                        .onReceive(timer) { input in
                            withAnimation(.easeInOut(duration:4)) {
                                scale = scales[stage] + 0.0001
                                scale = scales[stage]}}
                        .onAppear {
                            withAnimation(.easeInOut(duration:4)) {
                                scale = 0.8}}
                    
                        .foregroundStyle(
                            MeshGradient(width: 2, height: 2, points: [[0,0], [0,1], [1,0], [1,1]], colors:[ .black, .accentColor,. pink, .blue]))
                } else {}
                
                Text(breathingText)
                    .font(.title)
                    .contentTransition(.numericText())
                    .blendMode(.overlay)
                    .bold()
                
                    
                    .onReceive(timer) { input in
                        stage = (stage + 1) % breathingTextList.count
                    }
                    .onReceive(timer) { input in
                        withAnimation(.spring(duration:0.5)) {
                           
                            breathingText = breathingTextList[stage]
                            
                        }}
                
            }
        }
        
        .padding(.all)
        }
    }
    



#Preview {
    BreathingPage()
}
