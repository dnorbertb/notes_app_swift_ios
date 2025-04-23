//
//  AuthViewLogo.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 13/04/2025.
//

import SwiftUI

struct AuthViewLogo: View {
    var body: some View {
        Image(systemName: "pencil.line")
            .resizable()
            .scaledToFit()
            .frame(width: 56,  height: 56)
            .foregroundStyle(Color("AccentColor"))
        Text("notes app")
            .font(.title)
            .fontWeight(.semibold)
            .foregroundStyle(Color("AccentColor"))
        
        Spacer().frame(height: 16)
    }
}

#Preview {
    AuthViewLogo()
}
