//
//  SettingsView.swift
//  WorstenbroodjesApp
//
//  Created by Dré Van den Hooff on 12/10/2022.
//

import SwiftUI

struct SettingsView: View {
    @State private var darkmode = false
    
    @Environment(\.openURL) var openURL
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var apolloViewModel: ApolloViewModel
    
    var body: some View {
        NavigationView {
            Form {
                settings
                link
            }.navigationTitle("Instellingen")
        }
    }
    
    var settings: some View {
        Section(header: Text("App instellingen")) {
            Toggle(isOn: $darkmode, label : {
                Text("Dark mode")
            })
            .onChange(of: darkmode, perform: { value in
                if value {
                    apolloViewModel.toggleColorScheme(to: .dark)
                } else {
                    apolloViewModel.toggleColorScheme(to: .light)
                }
            })
            NavigationLink(destination: ChangeUsernameView(), label: {
                Section {
                    Label("Verander gebruikersnaam", systemImage: "square.and.pencil")
                }
            })
        }
    }
    
    var link: some View {
        Section {
            Button {
                openURL(URL(string: "https://dre-van-den-hooff.github.io/worstenbroodjes-app/")!)
            } label: {
                Label("Ga naar de website", systemImage: "link")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
