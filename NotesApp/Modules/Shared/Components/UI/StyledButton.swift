//
//  StyledButton.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 13/04/2025.
//

import SwiftUI

struct StyledButton: View {
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(
                LocalizedStringKey(text)
            )
            .frame(maxWidth: .infinity)
            .padding(16)
            .background(Color("AccentColor"))
            .foregroundColor(.black)
            .cornerRadius(10)
        }
    }
}


private struct StyledButtonPreview: View {
    var body: some View {
        StyledButton(text: "Hello") {
            print("Hello, world!")
        }.padding(10)
    }
}

#Preview {
    StyledButtonPreview()
}
