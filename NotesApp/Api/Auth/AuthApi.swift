//
//  AuthApi.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 07/04/2025.
//
import Foundation

class AuthApi: Fetchable {
    var apiBaseUrl: String = ProcessInfo.processInfo.environment["API_BASE_URL"] ?? ""
    
    func login(email: String, password: String) async -> ApiCallResult<AuthResponseWithToken> {
        let requestBodyData = LoginRequestBody(email: email, password: password)
        let response: ApiCallResult<AuthResponseWithToken> = await self.fetch(
            endpoint:"/auth/login",
            method: "POST",
            body: requestBodyData) { data, response in
                let statusCode = response.statusCode;
                if (statusCode != 200) {
                    return .failure(statusCode)
                }
                let token = response.allHeaderFields["Authorization"] as! String
                let decodedBody = try JSONDecoder().decode(AuthResponseBody.self, from: data)
                let data = AuthResponseWithToken(
                    success: decodedBody.success,
                    statusCode: decodedBody.statusCode,
                    data: decodedBody.data,
                    token: token,
                )
                return .success(data)
            }
        
        return response
    }
    
    func register(name: String, email: String, password: String) async -> ApiCallResult<AuthResponseWithToken> {
        let requestBodyData = RegisterRequestBody(name: name, email: email, password: password)
        let response: ApiCallResult<AuthResponseWithToken> = await self.fetch(
            endpoint:"/auth/register",
            method: "POST",
            body: requestBodyData) { data, response in
                let statusCode = response.statusCode;
                if (statusCode != 200) {
                    return .failure(statusCode)
                }
                let token = response.allHeaderFields["Authorization"] as! String
                let decodedBody = try JSONDecoder().decode(AuthResponseBody.self, from: data)
                let data = AuthResponseWithToken(
                    success: decodedBody.success,
                    statusCode: decodedBody.statusCode,
                    data: decodedBody.data,
                    token: token,
                )
                return .success(data)
            }
        
        return response
    }
    
    func fetchUser() {
        // This should fetch user data based on the auth token
        // Should return user data or nil
    }
    
}
