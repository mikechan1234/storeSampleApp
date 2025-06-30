//
//  SeatingList.swift
//  Cinemas
//
//  Created by Michael Chan on 28/04/2025.
//

import SwiftUI

struct SeatingList: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Seating List")
                .font(.headline)
                .padding()
            List {
                Text("Row 1")
                    .background(Color.red)
                    .containerRelativeFrame(.horizontal, alignment: .leading)
                Text("Row 2")
                    .background(Color.red)
                Text("Row 3")
                    .background(Color.red)
            }
            .listStyle(.plain)
        }
    }
}
