//
//  Validable.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 23/04/2025.
//

protocol Validable  {
    var rules: [ValidationRule] { get }
    func validate () -> (hasError: Bool, errors: [String: [String]])
}
