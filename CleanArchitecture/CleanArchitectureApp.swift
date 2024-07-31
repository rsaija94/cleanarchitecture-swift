//
//  CleanArchitectureApp.swift
//  CleanArchitecture
//
//  Created by mind on 05/03/24.
//

import SwiftUI

@main
struct CleanArchitectureApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewProduct: ProductViewModel())
        }
    }
}
