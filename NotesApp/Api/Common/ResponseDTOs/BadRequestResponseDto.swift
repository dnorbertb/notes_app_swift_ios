//
//  BadRequestResponseDto.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 11/04/2025.
//

import Foundation

struct BadRequestResponseDto {
    var statusCode: Int = 400
    var message: [String]
}
