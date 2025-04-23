//
//  AddNoteButton.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 14/04/2025.
//

import SwiftUI

struct AddNoteButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(
            action: {
               action()
            },
            label: {
                Image(
                    systemName: "square.and.pencil"
                )
                .resizable()
                .frame(width: 28, height: 28)
                .foregroundStyle(.white)
            }
        )
        .padding(.top, 11)
        .padding(.bottom, 13)
        .padding(.leading, 14)
        .padding(.trailing,10)
        .background(Color.accentColor)
        .cornerRadius(.infinity)
        .shadow(
            color: Color.accentColor.opacity(0.6),
            radius: 4,
            x: 0, y: 2
        )
    }
}

#Preview {
    AddNoteButton() {
        print("Hello, world")
    }
}
