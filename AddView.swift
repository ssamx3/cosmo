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
    @State var textBoxString = ""
    @State private var showPopup = false
    @Environment(\.dismiss) var dismiss
    @FocusState var focused: Bool
    
    // states
    
    
    private func entrySubmit(textEntered: String) {
        let captured = textEntered
        let new = Entry(body: captured, date: Date(), xCoord: CGFloat.random(in: 0...1), yCoord: CGFloat.random(in: 0...1), starSize: CGFloat.random(in: 10...25))
        
        
        modelContext.insert(new)
        textBoxString = ""
    }
    
    var body: some View {
        ZStack {
        
            VStack {
                TextEditor(text: $textBoxString)
                    .foregroundStyle(Color.white)
                    .focused($focused)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 16))
                    .scrollContentBackground(.hidden)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20.0)
                            .fill(Color.gray)
                            .opacity(0.1)
                            .shadow(radius: 10)
                    )
                
                Spacer()
            }
            .padding()
            .onAppear {
                focused = true
            }
            
           
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        entrySubmit(textEntered: textBoxString)
                        showPopup = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            showPopup = false
                        }
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "checkmark")
                        }
                        .padding(.all)
                        .background(
                            RoundedRectangle(cornerRadius: 100.0)
                                .stroke(Color.white, lineWidth: 2)
                                .fill(Color.gray)
                                .opacity(0.25)
                                .shadow(radius: 10)
                        )
                        .foregroundColor(.white)
                    }
                }
                .padding(.bottom , 15)
                .padding(.trailing, 5)
            }
            .padding()
            
            // Popup at bottom
            VStack {
                Spacer()
                if showPopup == true {
                    PopUp()
                        .padding(.bottom, 55)
                }
            }
        }
    }
       
}


    #Preview {
        if #available(iOS 17.0, *) {
            AddView()
        } else {
            ZStack {
            
            }
        }
        
    }
