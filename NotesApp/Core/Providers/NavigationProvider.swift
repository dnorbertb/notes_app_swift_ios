//
//  NavigationProvider.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 27/04/2025.
//

import SwiftUI

struct NavigationProvider<MainView: View>: View {
    @EnvironmentObject var router: Router
    let mainView: MainView
    
    init(_ mainView: MainView) {
        self.mainView = mainView
    }
    
    var body: some View {
        NavigationStack(path: $router.path) {
            mainView
                .navigationDestination(for: Routes.self) { route in
                    switch route {
                    case .settings:
                        SettingsView()
                    }
                }
        }
    }
}

