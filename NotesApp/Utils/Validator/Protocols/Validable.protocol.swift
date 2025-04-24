//
//  Validable.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 23/04/2025.
//

protocol Validable  {
    var data: [Sendable] { get }
    var validations: [[ValidatorFunction]] { get }
    func validate () -> (hasError: Bool, results: [[ValidationResult]])
}
