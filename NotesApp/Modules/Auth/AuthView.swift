//
//  LoginView.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 06/04/2025.
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        VStack(spacing: 10) {
            AuthViewLogo()
            AuthViewForm()
        }
    }
}

#Preview {
    AuthView().environmentObject(AuthManager())
}
