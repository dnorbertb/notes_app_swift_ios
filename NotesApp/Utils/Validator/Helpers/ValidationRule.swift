//
//  ValidationRule.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 24/04/2025.
//

struct ValidationRule {
    let name: String
    let data: Sendable
    let validators: [ValidatorFunction]
}
