//
//  AuthResponseBody.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 11/04/2025.
//

struct UserDataPayload: Codable {
    var id: Int
    var name: String
    var email: String
}

struct AuthResponseBody: Codable {
    var success: Bool = true
    var statusCode: Int = 200
    var data: UserDataPayload
}

struct AuthResponseWithToken: Codable {
    var success: Bool = true
    var statusCode: Int = 200
    var data: UserDataPayload
    var token: String
}
