//
//  EnvironmentView.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 27/04/2025.
//

import SwiftUI

struct EnvironmentView<Content: View>: View {
    let content: Content
    
    var body: some View {
        content
            .environmentObject(
                AuthManager()
            )
            .environmentObject(
                Router()
            )
    }
    
}
