//
//  Router.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk on 27/04/2025.
//

import SwiftUI

enum Routes: Hashable {
    case settings
}

class Router: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to route: Routes) {
        path.append(route)
    }
    
    func reset() {
        path = NavigationPath()
    }
}
