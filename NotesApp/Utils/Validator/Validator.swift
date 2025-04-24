//
//  Validator.swift
//  ClassValidator
//
//  Created by Norbert Bednarczyk on 16/04/2025.
//

struct Validator: Sendable,Validable {
    var data: [Sendable]
    var validations: [[ValidatorFunction]]
    
    init(_ data: [Sendable], _ validations: [[ValidatorFunction]]) {
        self.data = data
        self.validations = validations
    }
}
