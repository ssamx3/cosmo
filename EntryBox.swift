//
//  SwiftUIView.swift
//  cosmo
//
//  Created by sam on 04/02/2025.
//

import SwiftUI

struct EntryBox: View {
    let placeholder: String
    @Binding var text: String
    var body: some View {
        VStack(alignment: .center, spacing: 12){
            TextField(placeholder, text: $text)
                    .multilineTextAlignment(.center)
                    .font(.system(size:16))
                    .foregroundStyle(Color(.white))
                    .padding()
                    //.background(Color(.systemGray6))
                    .cornerRadius(30)
                    .padding(.all)
                    .overlay{
                        if #available(iOS 17.0, *) {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 2)
                                .fill(.gray)
                                .opacity(0.25)
                                .shadow(radius: 20.0)
                                .padding()
                        } else {
                            // Fallback on earlier versions
                        }
                    }
            }
            .padding(.all)
        }
    }

#Preview {
    EntryBox(placeholder: "im greatful for...", text: .constant(""))
}
