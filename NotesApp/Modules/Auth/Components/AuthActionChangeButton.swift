//
//  AuthViewFormActionChangeButton.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 13/04/2025.
//

import SwiftUI

struct AuthActionChangeButton: View {
    @Binding var action: AuthActions
    
    var body: some View {
        Button {
            action = action == .login
            ? .register
            : .login
        }
        label: {
            Text(
                action == .login
                ? "dont-have-account?"
                : "already-registered?",
            )
        }
       
        .padding(.top, 4)
    }
}

private struct AuthActionChangeButtonPreview: View {
    @State private var action: AuthActions = .login
    
    var body: some View {
        AuthActionChangeButton(action: $action)
    }
}

#Preview {
    AuthActionChangeButtonPreview()
}
