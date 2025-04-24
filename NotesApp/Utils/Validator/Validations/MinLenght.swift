//
//  MinLenght.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 24/04/2025.
//

import Foundation

func minLength(_ length: Int, _ message: String = "min-length-error") -> ValidatorFunction {
    return { data in
        let typedData = data as! String
        
        let regex = try! Regex("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        
        if typedData.contains(regex) {
            return .success
        } else {
            return .failure(message)
        }
    }
}
