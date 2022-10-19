//
//  SettingsView.swift
//  WorstenbroodjesApp
//
//  Created by Dré Van den Hooff on 12/10/2022.
//

import SwiftUI

struct SettingsView: View {
    @State private var darkmode = false
    @State private var useSystemPreference = false
    @Environment(\.openURL) var openURL
    @Environment(\.colorScheme) var colorScheme


    
    var body: some View {
        settingsList
    }
    
    var settingsList: some View {
        NavigationView {
            Form {
                Section(header: Text("App instellingen")) {
                    Toggle(isOn: $darkmode, label : {
                        Text("Dark mode")
                    })
                    .onChange(of: darkmode, perform: { value in
                        // TODO: change to darkmode
                    })
                    
                    Toggle(isOn: $useSystemPreference, label : {
                        Text("Gebruik systeemvoorkeur")
                    })
                    .onChange(of: useSystemPreference, perform: { value in
                        // TODO: Change to system preference
                    })
                }
                
                NavigationLink(destination: ChangeUsernameView(), label: {
                    Section {
                        Label("Verander gebruikersnaam", systemImage: "square.and.pencil")
                    }
                })
                
                
                Section {
                    Label("Ga naar de website", systemImage: "link")
                }
                .onTapGesture {
                    openURL(URL(string: "https://dre-van-den-hooff.github.io/worstenbroodjes-app/")!)
                }
            }
            .navigationTitle("Instellingen")
        }
 
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
