//
//  SwiftUIView.swift
//  cosmo
//
//  Created by sam on 09/02/2025.
//

import SwiftUI
import SwiftData

struct StarsView: View {
    @available(iOS 17, *)
    @Query private var entries: [Entry]
    
    @State private var animationOffset: CGFloat = 0

    var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.black, Color(hue: 0.711, saturation: 0.316, brightness: 0.3)]), startPoint: .top, endPoint: .bottom)
                
                if #available(iOS 17, *) {
                    ForEach(entries) { entry in
                        Image(systemName: "sparkle")
                            .foregroundColor(.white)
                            .font(.system(size: entry.starSize))
                            .position(
                                x: geo.size.width * entry.xCoord + sin(animationOffset + Double(entry.id.hashValue) * 0.3) * 2,
                                y: geo.size.height * entry.yCoord + cos(animationOffset + Double(entry.id.hashValue) * 0.15) * 1.5
                            )
                            .opacity(
                                0.6 + 0.35 * sin(animationOffset * 1.5 + Double(entry.id.hashValue) * 0.2)
                            )
                            .scaleEffect(
                                0.8 + 0.2 * sin(animationOffset * 0.8 + Double(entry.id.hashValue) * 0.3)
                            )
                    }
                }
                
                VStack {
                    if #available(iOS 17, *) {
                        Text(String(entries.count))
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                            .contentTransition(.numericText())
                    } else {
                        // Fallback on earlier versions
                    }

                    Text("entries")
                        .foregroundColor(Color(hue: 0.811, saturation: 0.316, brightness: 0.999))
                        

                }
                
                VStack {
                    Spacer()
                    Image(systemName: "chevron.down")
                        .opacity(0.5)
                        .padding()
                        
                        .font(.system(size: 25))
                        .bold()
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .onAppear {
            withAnimation(.linear(duration: 8).repeatForever(autoreverses: false)) {
                animationOffset = .pi * 4
            }
        }
    }
}

#Preview {
    StarsView()
}
