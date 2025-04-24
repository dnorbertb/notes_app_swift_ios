//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 28/03/2025.
//

import SwiftUI


@main
struct NotesApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                AppView().environmentObject(
                    AuthManager()
                )
            }
        }
    }
}



#Preview {
}
