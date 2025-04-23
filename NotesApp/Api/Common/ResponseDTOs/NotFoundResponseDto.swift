//
//  Login404ResponseDto.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 11/04/2025.
//

struct NotFoundResponseDto {
    var message: String
    var statusCode: Int = 404
    var success: Bool = false
}
