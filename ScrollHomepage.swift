//
//  SwiftUIView.swift
//  cosmo
//
//  Created by sam on 09/02/2025.
//

import SwiftUI
import SwiftData

struct ScrollHomepage: View {

    var body: some View {
        if #available(iOS 17.0, *) {
            ScrollView(.vertical, showsIndicators: false)    {
                
                LazyVStack(){
                    StarsView()
                            
                        .containerRelativeFrame([.horizontal, .vertical])
                        .ignoresSafeArea(edges: .bottom)
                    
                        
                    HomeView()
                        .containerRelativeFrame([.horizontal, .vertical])
                        .ignoresSafeArea(edges: .bottom)
                }
            }.scrollBounceBehavior(.always)
            .scrollTargetBehavior(.paging)
            
            
        }
        else {
            // Fallback on earlier versions
        }
    }
}

#Preview {
    ScrollHomepage()
}
