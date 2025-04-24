//
//  ValidationRule.extension.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 24/04/2025.
//

extension ValidationRule {
    func validate() -> [String] {
        self.validators.reduce([], { result, validator in
            let validatorResult = validator(self.data)
            if case .failure(let failure) = validatorResult {
                return result + [failure]
            }
            return result
        })
    }
}
