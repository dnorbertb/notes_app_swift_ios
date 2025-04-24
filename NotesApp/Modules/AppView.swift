//
//  AppView.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 30/03/2025.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        if (authManager.state == .loggedIn) {
            HomeView()
        } else {
            AuthView()
        }
    }
}

#Preview {
    AppView().environmentObject(
        AuthManager()
    )
}
