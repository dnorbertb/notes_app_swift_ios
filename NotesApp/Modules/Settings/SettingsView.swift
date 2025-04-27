//
//  SettingsView.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 27/04/2025.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var authManager: AuthManager
    @EnvironmentObject private var router: Router
    
    var body: some View {
        VStack {
            Spacer()
            Button {
                authManager.logout()
                router.reset()
            } label: {
                Text("logout")
                    .padding(10)
                    .background(Color.red)
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    EnvironmentProvider(SettingsView())
}
