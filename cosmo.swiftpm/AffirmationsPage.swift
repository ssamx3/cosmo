//
//  SwiftUIView.swift
//  cosmo
//
//  Created by sam on 13/02/2025.
//

import SwiftUI


// affirmations
struct AffirmationsPage: View {
    let affirmations = [
        "I am confident and capable.",
        "I am enough.",
        "I am loved.",
        "I am worthy of love and respect.",
        "I am capable of achieving my goals.",
        "I grow and improve every day.",
        "I am worthy of love for just being who I am.",
        "I am capable of so much.",
        "I am in control.",
        "I can change the world.",
        "I can make a difference.",
        "I trust myself.",
        "I am proud of how far I've come.",
        "I am resiliant.",
        "I am needed.",
        "I am allowed to feel good.",
        "I am peaceful and whole.",
        "I am optimistic because today is a new day.",
        "I am enough exactly as I am.",
        "I am worthy of investing in myself.",
        "I hold wisdom beyond knowledge.",
        "I strive for joy, not perfection.",
        "I am strong.",
        "I am a blessing.",
        "I am grateful.",
        "I am capable.",
        "I am believing in myself.",
        "I am unique and special.",
        "I am proud of myself",
        "I am wonderful just as I am.",
        "I matter.",
        "I am beautiful.",
        "I am not a burden."
        
    ]
    @State var currentAffirmation : String
    var body: some View {
        VStack {
            Text(currentAffirmation)
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .contentTransition(.numericText())
                .onAppear{
                        currentAffirmation = affirmations.randomElement() ?? "I am enough."
                    
                }.padding(.all)
            Button{
                withAnimation(.spring(duration:0.8)) {
                    currentAffirmation = affirmations.randomElement() ?? "I am enough."
                }
            } label: {
                if #available(iOS 17.0, *) {
                    HStack{
                        Text(" New affirmation ")
                        Image(systemName: "chevron.right" )
                    }
                    .padding(.all)
                    .background(
                        RoundedRectangle(cornerRadius: 20.0)
                            .stroke(Color.white, lineWidth: 2)
                            .fill(Color.gray)
                            .opacity(0.25)
                            .shadow(radius: 10)
                    )
                    .foregroundColor(.white)
                } else {
                }
                
            }
        }
    }
}

#Preview {
    AffirmationsPage(currentAffirmation: "I am enough.")
}
