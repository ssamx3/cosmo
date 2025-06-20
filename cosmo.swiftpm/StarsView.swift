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

    var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.black, .accentColor]), startPoint: .top, endPoint: .bottom)
                
                if #available(iOS 17, *) {
                    ForEach(entries) { Entry in
                        Image(systemName: "sparkle")
                            .foregroundColor(.white)
                            .font(.system(size: Entry.starSize))
                            .position(x: geo.size.width * Entry.xCoord, y: geo.size.height * Entry.yCoord)
                            .opacity(CGFloat.random(in: 0.60...0.95))
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
                        .foregroundColor(Color.white)
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
            .frame(width: geo.size.width, height: geo.size.height) // Full height fix
        }
    }
}

#Preview {
    StarsView()
}
