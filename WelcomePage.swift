//
//  SwiftUIView.swift
//  cosmo
//
//  Created by sam on 12/02/2025.
//

import SwiftUI

struct WelcomePage: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Welcome to Cosmo!")
                .font(.title)
                .fontWeight(.heavy)
                
            
            
            HStack(alignment: .top) {
                Image(systemName: "sparkles")
                    .aspectRatio(contentMode: .fill)
                    .font(.title)
                    .frame(width: 30)

                Text("View your gratitude galaxy on the homepage. Swipe up to reveal your entries!")
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }.padding(.vertical)

            HStack(alignment: .top) {
                Image(systemName: "heart.circle")
                    .aspectRatio(contentMode: .fill)
                    .font(.title)
                    .frame(width: 30)

                Text("Visit the toolbox to practice self-care with affirmations, breathing exercises and delete entries.")
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding(.vertical)

            HStack(alignment: .top) {
                Image(systemName: "sun.max")
                    .aspectRatio(contentMode: .fill)
                    .font(.title)
                    .frame(width: 30)

                Text("Take a minute to smile, and thank you for using cosmo <3")
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }.padding(.vertical)
            
            
        }
        Button{
        
            dismiss()
            
        } label: {
            if #available(iOS 17.0, *) {
                Text("Get Started")
                    .padding(.all)
                .background(
                    RoundedRectangle(cornerRadius: 20.0)
                        .stroke(Color.white, lineWidth: 2)
                        .fill(Color.gray)
                        .opacity(0.25)
                        .shadow(radius: 10)
                        .frame(width: UIScreen.main.bounds.width * 0.8)
                )
                .foregroundColor(.white)
            } else {
            }
            
        }
        .padding(.all)
        
            
    }
}

#Preview {
    WelcomePage()
}
