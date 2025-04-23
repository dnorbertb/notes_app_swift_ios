//
//  HomeBottomBar.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 14/04/2025.
//

import SwiftUI

struct HomeBottomBar: View {
    var body: some View {
        HStack {
            
            Button(
                action: {
                    print("Settings")
                },
                label: {
                    Image(
                        systemName: "gearshape.fill"
                    )
                    .resizable()
                    .frame(width: 28, height: 28)
                }
            )
            
            Spacer()
            
            AddNoteButton {
                print("New note")
            }
        }
    }
}

#Preview {
    HomeBottomBar()
}
