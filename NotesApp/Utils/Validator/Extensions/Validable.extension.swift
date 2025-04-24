//
//  Validable.extension.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 23/04/2025.
//

extension Validable {
    func validate () -> (hasError: Bool, errors: [String: [String]]) {
        let rulesResults = rules.map { rule in
            (rule.name, rule.validate())
        }
        let hasError = rulesResults
            .flatMap({ $1 })
            .count > 0
        
        let errors = Dictionary(uniqueKeysWithValues: rulesResults)
        return (hasError: hasError, errors: errors)
    }
}
