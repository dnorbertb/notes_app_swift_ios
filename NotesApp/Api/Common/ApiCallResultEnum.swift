//
//  ApiCallResult.enum.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 11/04/2025.
//

enum ApiCallResult<T> {
    case success(T)
    case failure(Int)
}
