//
//  Validable.extension.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 23/04/2025.
//

extension Validable {
    func validate () -> (hasError: Bool, results: [[ValidationResult]]) {
        let results = data.enumerated().map {index, data in
            let validators: [ValidatorFunction] = self.validations[index]
            let results = validators.map {validator in validator(data)}
            return results
        }
        
        let hasError = results
            .joined()
            .contains(where: { $0 == .failure(nil) })
        
        return (hasError: hasError, results: results)
    }
}
