//
//  NotesListItem.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 14/04/2025.
//

import SwiftUI

struct NotesListItem: View {
    var text: String
    @Environment(\.colorScheme) var colorScheme
    
    init (_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .lineLimit(1)
            .truncationMode(.tail)
            .frame(
                maxWidth: .infinity,
                alignment: .leading,
            )
            .padding(.horizontal, 12)
            .padding(.vertical, 16)
            .foregroundStyle(.white)
            .background(
                Color
                    .gray
                    .opacity(
                        colorScheme == .dark
                        ? 0.3
                        : 0.5
                    )
            )
            .cornerRadius(12)
    }
}

#Preview {
    NotesListItem("Hello, World!").padding(10)
}
