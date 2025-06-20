//
//  SwiftUIView.swift
//  cosmo
//
//  Created by sam on 11/02/2025.
//

import SwiftUI

struct PopUp: View {
    var body: some View {
        HStack {
            if #available(iOS 18.0, *) {
                Image(systemName: "checkmark")
                    .symbolEffect(.bounce.up.byLayer, options: .nonRepeating)
            } else {
                // Fallback on earlier versions
            }
            Text("Submitted")
            
        }.padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .shadow(radius: 4)
            .transition(.opacity)
        
            
    }
}

#Preview {
    PopUp()
}
