//
//  isStrongPassword.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 24/04/2025.
//

struct PasswordRules {
    var minLength: Int?
    var minUppercase: Int?
    var minLowercase: Int?
    var minNumbers: Int?
    var minSymbols: Int?
}

func isStrongPassword(
    _ rules: PasswordRules,
    message: String = "is-strong-password-error"
) -> ValidatorFunction {
    return { data in
        guard let password = data as? String else {
            return .failure(message)
        }

        // Counts
        let uppercaseCount = password.filter { $0.isUppercase }.count
        let lowercaseCount = password.filter { $0.isLowercase }.count
        let numberCount = password.filter { $0.isNumber }.count
        let symbolCount = password.filter { !$0.isLetter && !$0.isNumber }.count

        // Validations
        if let minLength = rules.minLength, password.count < minLength {
            return .failure(message)
        }

        if let minUppercase = rules.minUppercase, uppercaseCount < minUppercase {
            return .failure(message)
        }

        if let minLowercase = rules.minLowercase, lowercaseCount < minLowercase {
            return .failure(message)
        }

        if let minNumbers = rules.minNumbers, numberCount < minNumbers {
            return .failure(message)
        }

        if let minSymbols = rules.minSymbols, symbolCount < minSymbols {
            return .failure(message)
        }

        return .success
    }
}
