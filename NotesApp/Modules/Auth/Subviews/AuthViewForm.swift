//
//  AuthViewForm.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 13/04/2025.
//
import SwiftUI

struct AuthViewForm: View {
    @State var action: AuthActions = .login
    @EnvironmentObject var authManager: AuthManager
    @State var formErrors: [String: [String]] = [:]
    
    private func submitHandler() async -> Void {
        let rules = getValidationRules()
        let validator = Validator(rules)
        let (hasError, errors) = validator.validate()
        formErrors = errors
        
        if (hasError) {
            return
        }
        
        if (action == .login) {
            await authManager.login()
        } else {
            await authManager.register()
        }

    }
    
    var body: some View {
        VStack(spacing: 10) {
            
            if(action == .register) {
                StyledTextField(
                    text: $authManager.userName,
                    error: createErrorBinding(for: "name"),
                    placeholder: "name"
                )
                .autocorrectionDisabled(true)
                .disabled(authManager.state == .loading)
            }
            
            StyledTextField(
                text: $authManager.email,
                error: createErrorBinding(for: "email"),
                placeholder: "email"
            )
            .autocorrectionDisabled(true)
            .autocapitalization(.none)
            .disabled(authManager.state == .loading)
            
            StyledTextField(
                text: $authManager.password,
                error: createErrorBinding(for: "password"),
                placeholder: "password",
                isSecure: true
            )
            .autocorrectionDisabled(true)
            .autocapitalization(.none)
            .disabled(authManager.state == .loading)
            
            if (authManager.state == .error) {
                ErrorCaption(message: authManager.error)
            }
            
            Spacer().frame(height: 5)
            
            StyledButton(
                text: action == .login
                ? "login"
                : "register",
                action: {
                    Task {
                        await submitHandler()
                    }
                }
            ).disabled(authManager.state == .loading)
            
            AuthActionChangeButton(action: $action)
                .disabled(authManager.state == .loading)
            
        }.padding(20)
    }
}


#Preview {
    AuthViewForm().environmentObject(
        AuthManager()
    )
}

