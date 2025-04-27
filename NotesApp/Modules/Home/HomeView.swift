//
//  View.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 05/04/2025.
//

import SwiftUI

struct HomeView: View {
    @State private var editMode: Bool = false
    // HomeViewModel, pobrać notatki
    // Usuwać notatki
    // Sortować po dacie edycji
    
    var body: some View {
        VStack {
            HomeTopBar(editMode: $editMode)
            Spacer(minLength: 32)
            NotesList()
            HomeBottomBar()
        }
        .padding(.horizontal, 16)
        .padding(.top, 8)
    }
}

#Preview {
    HomeView()
}
