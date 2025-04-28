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
    @State private var showDialog = false
    
    var body: some View {
        VStack {
            HStack {
                Text("logged-in-as \(authManager.userName), \(authManager.email)")
                    .foregroundStyle(.secondary)
            }.frame(
                maxWidth: .infinity,
                alignment: .leading,
            ).padding(.top, 16)
            
            Spacer()
            
            Button(
                action: {
                    showDialog.toggle()
                },
                label: {
                    Text("logout")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.red)
                        )
                        .foregroundStyle(.white)
                }
            )
            .alert(
                isPresented: $showDialog,
                content: {
                    Alert(
                        title: Text(
                            LocalizedStringKey("you-will-be-logged-out")
                        ),
                        primaryButton:
                                .cancel(),
                        secondaryButton:
                                .destructive(
                                    Text("logout"),
                                    action: {
                                        authManager.logout()
                                        router.reset()
                                    }
                                ),
                    )
                }
            )
        }.padding(.horizontal)
    }
}

#Preview {
    EnvironmentProvider(SettingsView())
}
