//
//  AuthViewForm.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 13/04/2025.
//

import SwiftUI

struct AuthViewForm: View {
    @State private var action: AuthActions = .login
    @EnvironmentObject var authManager: AuthManager
    @State var validationResult: ValidationResult?
    
    private func loginHandler() async -> Void {
        let validator = Validator(
            [
                authManager.email,
                authManager.password
            ],
            [
                [isEmail(nil)],
                []
            ]
        )
        let (hasError, results) = validator.validate()
        validationResult = results.first?.first
        
        if (hasError) {
            return
        }
        
        await authManager.login()
    }
    
    private func registerHandler() async -> Void {
        
    }
    
    var body: some View {
        VStack(spacing: 10) {
            
            if(action == .register) {
                StyledTextField(
                    text: $authManager.email,
                    placeholder: "name"
                )
                .autocorrectionDisabled(true)
                .disabled(authManager.state == .loading)
            }
            
            StyledTextField(
                text: $authManager.email,
                placeholder: "email"
            )
            .autocorrectionDisabled(true)
            .autocapitalization(.none)
            .disabled(authManager.state == .loading)
            
            StyledTextField(
                text: $authManager.password,
                placeholder: "password",
                isSecure: true
            )
            .autocorrectionDisabled(true)
            .autocapitalization(.none)
            .disabled(authManager.state == .loading)
            
            if (authManager.state == .error) {
                ErrorCaption(message: authManager.error)
            }
            
            if let validationResult,
               case .failure(let message) = validationResult {
                ErrorCaption(message: message ?? "Wystąpił błąd")
            }
            
            Spacer().frame(height: 5)
            
            StyledButton(
                text: action == .login
                ? "login"
                : "register",
                action: {
                    Task {
                        await action == .login
                        ? loginHandler()
                        : registerHandler()
                    }
                }
            ).disabled(authManager.state == .loading)
            
            AuthActionChangeButton(action: $action)
                .disabled(authManager.state == .loading)
            
        }.padding(20)
    }
}


#Preview {
    AuthViewForm().environmentObject(AuthManager())
}

