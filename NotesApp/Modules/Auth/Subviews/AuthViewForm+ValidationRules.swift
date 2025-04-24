//
//  AuthViewForm.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 13/04/2025.
//
import SwiftUI

// Validation Rules
extension AuthViewForm {
    func getValidationRules() -> [ValidationRule] {
        var base = [
            ValidationRule(
                name: "email",
                data: authManager.email,
                validators: [isEmail()]
            ),
            ValidationRule(
                name: "password",
                data: authManager.password,
                validators: [
                    isStrongPassword(
                        PasswordRules(
                            minLength: 8,
                            minUppercase: 1,
                            minLowercase: 1,
                            minNumbers: 1,
                            minSymbols: 1
                        )
                    )
                ]
            )
        ]
        
        if (action == .register) {
            base.append(
                ValidationRule(
                    name: "name",
                    data: authManager.userName,
                    validators: [isNotEmptyString()]
                )
            )
        }
        
        return base
    }
}
