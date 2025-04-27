//
//  HomeBottomBar.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 14/04/2025.
//

import SwiftUI

struct HomeBottomBar: View {
    @EnvironmentObject private var router: Router
    
    var body: some View {
        HStack {
            Button(
                action: {
                    router.navigate(to: .settings)
                },
                label: {
                    Image(
                        systemName: "gearshape.fill"
                    )
                    .resizable()
                    .frame(width: 32, height: 32)
                }
            )
            
            Spacer()
            
            AddNoteButton {
                print("New note")
            }
        }.frame(alignment: .bottom)
    }
}

#Preview {
    HomeBottomBar()
        .environmentObject(Router())
}
