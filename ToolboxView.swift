//
//  SwiftUIView.swift
//  cosmo
//
//  Created by sam on 09/02/2025.
//

import SwiftUI

@available(iOS 17.0, *)
struct ToolboxView: View {
    @State private var isSheetPresented = false
    @State private var isSheet2Presented = false
    @State private var isDelPresented: Bool = false
    @Environment(\.modelContext) private var modelContext
    var body: some View {
        VStack(alignment: .leading) {
            Text("Toolbox")
                .font(.largeTitle)
                .bold()
                
            
            Button{
                isSheetPresented.toggle()
            } label: {
                if #available(iOS 17.0, *) {
                    VStack(alignment: .leading) {
                        HStack{
                            Text("Breathing")
                                .bold()
                            Image(systemName: "wind" )
                        }
                        
                        Text("Practice square breathing to help you relax and be calm.")
                            .multilineTextAlignment(.leading)
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
            
            
        
        
            Button{
                    isSheet2Presented.toggle()
                } label: {
                    if #available(iOS 17.0, *) {
                        VStack(alignment: .leading) {
                            HStack{
                                Text("Affirmations")
                                    .bold()
                                Image(systemName: "star" )
                            }
                            
                            Text("Read positive affirmations to boost your mood and self-esteem.")
                                .multilineTextAlignment(.leading)
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
            
            
            Button{
                isDelPresented = true
            } label: {
                if #available(iOS 17.0, *) {
                    HStack{
                        Text("Delete all entries")
                        Image(systemName: "x.circle" )
                    }
                    .padding(.all)
                    .background(
                        RoundedRectangle(cornerRadius: 20.0)
                            .stroke(Color.red, lineWidth: 2)
                            .fill(Color.red)
                            .opacity(0.25)
                            .shadow(radius: 10)
                    )
                    .foregroundColor(.white)
                } else {
                }
                
            }
        }
        
        .confirmationDialog("Would you like to delete all entries?", isPresented: $isDelPresented){
            Button("Delete all", role: .destructive) {
                do {
                    try modelContext.delete(model: Entry.self)
                    try modelContext.save()
                } catch {
                    print("Failed to delete entries.")
                }
            }
        }
        
        
        .sheet(isPresented: $isSheetPresented) {
            BreathingPage()
            .presentationDetents([.large])}
        .sheet(isPresented: $isSheet2Presented) {
            AffirmationsPage(currentAffirmation: "I am proud of who I am.")
            .presentationDetents([.large])}
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        ToolboxView()
    } else {
        // Fallback on earlier versions
    }
}
