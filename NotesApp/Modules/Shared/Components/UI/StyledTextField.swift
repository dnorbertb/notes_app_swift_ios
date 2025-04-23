//
//  StyledTextField.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 13/04/2025.
//

import SwiftUI

struct StyledTextField: View {
    @Binding var text: String
    @FocusState var isFocused: Bool
    @Environment(\.colorScheme) var colorScheme
    var placeholder: String?
    var isSecure: Bool = false
    var isError: Bool = false
    
    private var borderColor: Color {
        if(isError) {
            return .red
        }
        
        if(isFocused) {
            return .accentColor
        }
        
        return .white.opacity(0)
    }
    
    var body: some View {
        Group {
            if isSecure {
                SecureField(
                    LocalizedStringKey(placeholder ?? ""),
                    text: $text
                )
            } else {
                TextField(
                    LocalizedStringKey(placeholder ?? ""),
                    text: $text
                )
            }
        }
        .padding(16)
        .background(
            Color.gray.opacity(
                colorScheme == .dark ? 0.3 : 0.15
            )
        )
        .overlay(
            RoundedRectangle(
                cornerRadius: 10
            )
            .stroke(
                borderColor,
                lineWidth: 3
            )
        )
        .cornerRadius(10)
        .focused($isFocused)
        .onTapGesture {
            isFocused.toggle()
        }
    }
}

private struct StyledTextFieldPreviewWrapper: View {
    @State private var text: String = "Hello"
    
    var body: some View {
        StyledTextField(text: $text)
            .padding()
    } 
}

#Preview {
    StyledTextFieldPreviewWrapper()
}

