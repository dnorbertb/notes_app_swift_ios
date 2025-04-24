//
//  ValidationResult.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 23/04/2025.
//

extension ValidationResult {
    static func ==(lhs: ValidationResult, rhs: ValidationResult) -> Bool {
        switch (lhs, rhs) {
        case (.success, .success):
            return true
        case (.failure, .failure):
            return true
        default:
            return false
        }
    }
}
