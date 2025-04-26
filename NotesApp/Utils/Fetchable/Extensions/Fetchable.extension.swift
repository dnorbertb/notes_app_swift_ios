//
//  Fetchable.extension.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 26/04/2025.
//

import Foundation

extension Fetchable {
    func fetch<RequestBody: Codable, RequestResponse: Codable>(
        endpoint: String,
        method: String = "GET",
        headers: [String: String] = [:],
        body: RequestBody? = nil,
        extractFunction: (_ body: Data, _ response: HTTPURLResponse) throws -> ApiCallResult<RequestResponse>,
    ) async -> ApiCallResult<RequestResponse> {
        do {
            let url = URL(string: "\(self.apiBaseUrl)\(endpoint)")!
            var request = URLRequest(url: url)
            request.httpMethod = method
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("include", forHTTPHeaderField: "Credentials")
            headers.forEach { key, value in
                request.setValue(value, forHTTPHeaderField: key)
            }
            request.httpBody = body != nil ? try JSONEncoder().encode(body) : nil
            let response = try await URLSession.shared.data(for: request)
            let (responseBody, responseData) = response
            let callResult = try extractFunction(responseBody, responseData as! HTTPURLResponse)
            return callResult
        } catch {
            print(error)
            return .failure(500)
        }
    }
}
