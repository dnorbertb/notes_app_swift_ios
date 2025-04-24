//
//  AuthViewForm.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 13/04/2025.
//
import SwiftUI

extension AuthViewForm {
    func createErrorBinding(for field: String) -> Binding<String?> {
        return Binding(
            get: {
                formErrors[field]?.first
            },
            set: {
                data in formErrors[field] = []
            }
        )
    }
}
