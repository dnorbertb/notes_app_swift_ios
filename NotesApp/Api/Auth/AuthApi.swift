//
//  AuthApi.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 07/04/2025.
//
import Foundation

class AuthApi {
    private let baseURL = ProcessInfo.processInfo.environment["API_BASE_URL"]

    func login(email: String, password: String) async -> ApiCallResult<AuthResponseWithToken> {
        do {
            let url = URL(string: "\(baseURL ?? "")/auth/login")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("include", forHTTPHeaderField: "Credentials")
            
            let requestBodyData = LoginRequestBody(email: email, password: password)
            let requestBodyJson = try JSONEncoder().encode(requestBodyData)
            request.httpBody = requestBodyJson
            
            let response = try await URLSession.shared.data(for: request)
            let (responseBody, responseData) = response
            let httpResponseData = responseData as! HTTPURLResponse // as should probably be done different in bigger app and apis
            let statusCode = httpResponseData.statusCode;
            
            if (statusCode != 200) {
                return .failure(statusCode)
            }
            
            let token = httpResponseData.allHeaderFields["Authorization"] as! String
            print(token)
            let decodedBody = try JSONDecoder().decode(AuthResponseBody.self, from: responseBody)
            let data = AuthResponseWithToken(
                success: decodedBody.success,
                statusCode: decodedBody.statusCode,
                data: decodedBody.data,
                token: token,
            )
            
            return .success(data)
        } catch {
            print(error)
            return .failure(500)
        }
    }
    
    func register(name: String, email: String, password: String) async -> ApiCallResult<AuthResponseWithToken> {
        do {
            let url = URL(string: "\(baseURL ?? "")/auth/register")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("include", forHTTPHeaderField: "Credentials")
    
            let requestBodyData = RegisterRequestBody(name: name, email: email, password: password)
            let requestBodyJson = try JSONEncoder().encode(requestBodyData)
            request.httpBody = requestBodyJson
            
            let response = try await URLSession.shared.data(for: request)
            let (responseBody, responseData) = response
            let httpResponseData = responseData as! HTTPURLResponse // as should probably be done different in bigger app and apis
            let statusCode = httpResponseData.statusCode;
            
            if (statusCode != 200) {
                return .failure(statusCode)
            }
            
            let token = httpResponseData.allHeaderFields["Authorization"] as! String
            print(token)
            let decodedBody = try JSONDecoder().decode(AuthResponseBody.self, from: responseBody)
            let data = AuthResponseWithToken(
                success: decodedBody.success,
                statusCode: decodedBody.statusCode,
                data: decodedBody.data,
                token: token,
            )
            
            return .success(data)
        } catch {
            print(error)
            return .failure(500)
        }
    }
    
    func fetchUser() {
        // This should fetch user data based on the auth token
        // Should return user data or nil
    }
    
}
