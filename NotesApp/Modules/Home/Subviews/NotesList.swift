//
//  NotesList.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 14/04/2025.
//

import SwiftUI

struct NotesList: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                NotesListItem("To jest pierwsza mega mega mega długa dłuuuuuuuugaaaa notatka")
                NotesListItem("To jest druga notatka")
            }
        }
    }
}


#Preview {
    NotesList().padding(10)
}
