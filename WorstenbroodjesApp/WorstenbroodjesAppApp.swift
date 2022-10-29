//
//  WorstenbroodjesAppApp.swift
//  WorstenbroodjesApp
//
//  Created by Dré Van den Hooff on 12/10/2022.
//

import SwiftUI

@main
struct WorstenbroodjesAppApp: App {
    @StateObject var apolloViewModel = ApolloViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(apolloViewModel)
                .environment(\.colorScheme, apolloViewModel.currentScheme)
        }
    }
}
