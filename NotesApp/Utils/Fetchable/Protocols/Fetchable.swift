//
//  Fetchable.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 26/04/2025.
//

import Foundation


protocol Fetchable {
    var apiBaseUrl: String { get }
    
    func fetch<RequestBody: Codable, RequestResponse: Codable>(
        endpoint: String,
        method: String,
        headers: [String: String],
        body: RequestBody,
        extractFunction: (_ body: Data, _ response: HTTPURLResponse) throws -> ApiCallResult<RequestResponse>,
    ) async -> ApiCallResult<RequestResponse>
}
