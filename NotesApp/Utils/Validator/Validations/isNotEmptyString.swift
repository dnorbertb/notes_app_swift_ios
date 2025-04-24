//
//  isNotEmptyString.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 24/04/2025.
//

func isNotEmptyString(_ message: String = "is-not-empty-string-error") -> ValidatorFunction {
    return { data in
        guard let typedData = data as? String, !typedData.isEmpty else {
            return .failure(message)
        }
        return .success
    }
}
