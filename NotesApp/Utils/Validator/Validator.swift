//
//  Validator.swift
//  ClassValidator
//
//  Created by Norbert Bednarczyk on 16/04/2025.
//

struct Validator: Sendable, Validable {
    let rules: [ValidationRule]
    
    init(_ rules: [ValidationRule]) {
        self.rules = rules
    }
}
