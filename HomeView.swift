//
//  SwiftUIView.swift
//  cosmo
//
//  Created by sam on 09/02/2025.
//

import SwiftUI
import SwiftData


struct HomeView: View {
    @available(iOS 17, *)
    @Query(
        sort: \Entry.date,
        order: .reverse
    ) private var Entries: [Entry]
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Journal")
                .font(.title)
                .bold()
                .padding([.top, .leading, .trailing])
            
            if #available(iOS 17, *) {
                List(Entries) { Entry in
                    HStack {
                        Text(Entry.body)
                        Spacer()
                        Text(Entry.date, format: .dateTime.hour().minute().day().month())
                            .font(.caption2)
                            .fontWeight(.light)
                            .foregroundColor(Color.gray)
                    }
                }} else {}}}}
#Preview {
    HomeView()
}
