//
//  SwiftUIView.swift
//  cosmo
//
//  Created by sam on 09/02/2025.
//

import SwiftUI
import SwiftData

@available(iOS 17, *)
struct HomeView: View {
    @Query(
        sort: \Entry.date,
        order: .reverse
    ) private var Entries: [Entry]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Journal")
                .font(.title)
                .bold()
                .padding([.top, .leading, .trailing])
            
            List(Entries) { entry in
                HStack {
                    Text(entry.body)
                    Spacer()
                    Text(entry.date, format: .dateTime.hour().minute().day().month())
                        .font(.caption2)
                        .fontWeight(.light)
                        .foregroundColor(Color.gray)
                }
                .padding(.vertical, 4)
            }
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    if #available(iOS 17, *) {
        HomeView()
    } else {
        ZStack {}
    }
}
