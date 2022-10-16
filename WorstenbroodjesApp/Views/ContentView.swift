//
//  ContentView.swift
//  WorstenbroodjesApp
//
//  Created by Dré Van den Hooff on 12/10/2022.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            LeaderboardView()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Leaderboard")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profiel")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear.circle")
                    Text("Instellingen")
                }
        }
        .accentColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ApolloViewModel())
    }
}
