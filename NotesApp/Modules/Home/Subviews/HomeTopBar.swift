//
//  HomeTopBar.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 14/04/2025.
//

import SwiftUI

struct HomeTopBar: View {
    @Binding var editMode: Bool
    
    var body: some View {
        HStack {
            Text("home-title")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(
                    Color("AccentColor")
                )
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
            
            Button {
                editMode.toggle()
            } label: {
                Text(editMode ? "done" : "edit")
            }
        }
    }
}

private struct HomeTopBarPreview: View {
    @State private var editMode: Bool = false
    
    var body: some View {
        HomeTopBar(editMode: $editMode).padding(10)
        Spacer()
    }
    
}

#Preview {
    HomeTopBarPreview()
}
