//
//  ViewModel.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 06/04/2025.
//

import Foundation
import KeychainSwift

enum AuthState: String {
    case loggedIn
    case loggedOut
    case loading
    case error
}

@MainActor // TODO: Check other possibilities
class AuthManager: ObservableObject {
    private let authApi: AuthApi
    private let keychain: KeychainSwift
    private let authTokenName = "\(Bundle.main.bundleIdentifier ?? "defualt").authToken"
    @Published private(set) var state: AuthState = .loggedOut
    @Published var userName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    @Published var error: String = ""
    
    private let FailureCodesMap: [Int: String] = [
        400: "incorrect-values",
        401: "invalid-credentials",
        404: "user-not-found",
        409: "user-already-exist",
        500: "server-error"
    ]
    
    private func saveAuthToken(_ token: String) {
        keychain.set(token, forKey: authTokenName)
    }
    
    private func getAuthToken() -> String? {
        let token = keychain.get(authTokenName)
        return token
    }
    
    private func removeToken() {
        keychain.delete(authTokenName)
    }
    
    init(authApi: AuthApi = AuthApi(), keychain: KeychainSwift = KeychainSwift()) {
        self.authApi = authApi
        self.keychain = keychain
        verifyUser()
    }
    
    func login() async {
        state = .loading
        let result =  await authApi.login(email: email, password: password)
                
        if case .failure(let code) = result {
            print("Error: \(code)")
            state = .error
            error = FailureCodesMap[code] ?? "unknown-error"
            return
        }
        
        if case .success(let data) = result {
            saveAuthToken(data.token)
            state = .loggedIn
            return
        }
    }
    
    func register() async {
        state = .loading
        let result = await authApi.register(name: userName, email: email, password: password)
        
        if case .failure(let code) = result {
            print("Error: \(code)")
            state = .error
            error = FailureCodesMap[code] ?? "unknown-error"
            return
        }
        
        if case .success(let data) = result {
            saveAuthToken(data.token)
            state = .loggedIn
            return
        }
    }
    
    func logout() {
        removeToken()
        self.state = .loggedOut
    }
    
    func verifyUser() {
        // This is demo app and i will not include any complicated logic here
        // But in real case there would be probably also a refresh token
        // This func should check if there is a token, if it should be refreshed etc
        // Maybe verify if token is valid by calling authApi.fetchUser etc.
        // And in general care about token to be valid all the time user uses the app
        if let _ = getAuthToken() {
            self.state = .loggedIn
        } else {
            self.state = .loggedOut
        }
    }
}
