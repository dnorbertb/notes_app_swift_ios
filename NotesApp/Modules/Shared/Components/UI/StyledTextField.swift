//
//  StyledTextField.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 13/04/2025.
//
import SwiftUI

struct StyledTextField: View {
    @Binding var text: String
    @Binding var error: String?
    @FocusState var isFocused: Bool
    @Environment(\.colorScheme) var colorScheme
    var placeholder: String?
    var isSecure: Bool = false
    
    init(
        text: Binding<String>,
        error: Binding<String?> = .constant(nil),
        placeholder: String? = nil,
        isSecure: Bool = false
    ) {
        self._text = text
        self._error = error
        self.placeholder = placeholder
        self.isSecure = isSecure
    }
    
    private var borderColor: Color {
        if(error != nil) {
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
        .onChange(of: isFocused) { newValue in
            if newValue {
                error = nil
            }
        }
        .onTapGesture {
            isFocused = true
        }
        
        if let error = $error.wrappedValue {
            ErrorCaption(message: Binding(get: { error }, set: { _ in }))
        }
    }
}

private struct StyledTextFieldPreviewWrapper: View {
    @State private var text: String = "Hello"
    @State private var error: String? = "Test error"
    
    var body: some View {
        StyledTextField(text: $text, error: $error)
            .padding()
    }
}

#Preview {
    StyledTextFieldPreviewWrapper()
}

