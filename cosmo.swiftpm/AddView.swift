//
//  SwiftUIView.swift
//  cosmo
//
//  Created by sam on 02/02/2025.
//

import SwiftUI
import SwiftData

@available(iOS 17, *)
@Model

class Entry {
    var id = UUID()
    var body: String
    var date : Date
    var xCoord: CGFloat
    var yCoord: CGFloat
    var starSize: CGFloat
    init (body: String, date: Date = Date(), xCoord: CGFloat, yCoord: CGFloat, starSize: CGFloat ) {
        self.id = UUID()
        self.body = body
        self.date = date
        self.xCoord = xCoord
        self.yCoord = yCoord
        self.starSize = starSize
    }
}


@available(iOS 17.0, *)

struct AddView: View {
    @Environment(\.modelContext) private var modelContext
   
    // states
    @State var enter: String = ""
    @State var textBoxString = "I'm grateful for..."
    @State private var showPopup = false
    @Environment(\.dismiss) var dismiss
    @FocusState var focused: Bool
    
    // states
    
    
    private func entrySubmit(textEntered: String) {
        let captured = textEntered
        let new = Entry(body: captured, date: Date(), xCoord: CGFloat.random(in: 0...1), yCoord: CGFloat.random(in: 0...1), starSize: CGFloat.random(in: 10...25))
        
        
        modelContext.insert(new)
        textBoxString = "I'm grateful for..."
    }
    
    var body: some View {
        
            ZStack{
                //meshgradient background
                
                
                TimelineView(.animation) { timeline in
                    let x = (sin(timeline.date.timeIntervalSince1970) + 1) / 16
                    let y = (cos(timeline.date.timeIntervalSince1970) + 6) / 32
                    
                    
                    if #available(iOS 18.0, *) {
                        MeshGradient(width: 3, height: 3, points: [
                            [0, 0], [0.5, 0], [1, 0],
                            [0, 0.5], [Float(x), Float(y)], [1, 0.5],
                            [0, 1], [0.5, 1], [1, 1]
                        ], colors: [
                            .blue, .black, .black,
                            .black, .accentColor, .blue,
                            .black, .black, .black
                        ])
                        .ignoresSafeArea()
                        .onTapGesture {
                            focused = false
                        }
                    } else {
                        
                    }
                }
                
                // meshgradient background
                
                // frosted glass
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(.white)
                        .opacity(0.25)
                        .shadow(radius: 10.0)
                        .padding(.horizontal)
                        .onTapGesture {
                            focused = false
                        }
                    
                    
                    // frosted glass
                    
                    // entry field and submit button
                    
                    VStack {
                        
                        
                        
                        EntryBox(placeholder: "type something you're grateful for...", text: $textBoxString).focused($focused)
                        
                        Button{
                            entrySubmit(textEntered: textBoxString)
                            showPopup = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                
                                showPopup = false
                                
                            }
                            dismiss()
                        } label: {
                            if #available(iOS 17.0, *) {
                                HStack{
                                    Text(" submit")
                                        .font(.body)
                                    
                                    Image(systemName: "square.and.pencil" )
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
                    .padding()
                    VStack {
                        Spacer()
                    if showPopup == true {
                        VStack {
                            Spacer()
                            PopUp()
                                .padding(.bottom, 55)
                        }
                    }
                }
                    
                }.fixedSize(horizontal: false, vertical: true)
                
            }
            
            
        
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        AddView()
    } else {
        // Fallback on earlier versions
    }
    
}
