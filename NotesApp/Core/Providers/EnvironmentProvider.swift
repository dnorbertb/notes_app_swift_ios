//
//  EnvironmentProvider.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 27/04/2025.
//

import SwiftUI

struct EnvironmentProvider<Content: View>: View {
    let content: Content
    
    init (_ content: Content) {
        self.content = content
    }
    
    var body: some View {
        content
            .environmentObject(
                Router()
            )
            .environmentObject(
                AuthManager()
            )
    }
    
}
