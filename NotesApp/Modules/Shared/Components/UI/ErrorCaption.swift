//
//  ErrorCaption.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 13/04/2025.
//

import SwiftUI

struct ErrorCaption: View {
    @Binding var message: String
    
    var body: some View {
        Text(LocalizedStringKey(message))
            .font(.caption)
            .foregroundColor(.red)
    }
}

private struct ErrorCaptionPreview: View {
    @State private var message = "Hello, World!"
    
    var body: some View {
        ErrorCaption(message: $message)
            .padding(10)
    }
}

#Preview {
    ErrorCaptionPreview()
}
