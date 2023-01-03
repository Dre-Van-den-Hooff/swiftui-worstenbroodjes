//
//  ChangeUsernameView.swift
//  WorstenbroodjesApp
//
//  Created by Dré Van den Hooff on 16/10/2022.
//

import SwiftUI
import AlertToast

struct ChangeUsernameView: View {
    @State private var name = ""
    @State private var succesToast = false
    @State private var errorToast = false
    @EnvironmentObject var apolloViewModel: ApolloViewModel

    var body: some View {
        Form {
            Section {
                TextField("Nieuwe gebruikersnaam", text: $name)
     
                Button("Bevestigen") {
                    // New name should be 3 characters or more
                    if name.count >= 3 {
                        apolloViewModel.updateUserName(id: apolloViewModel.loggedInUser.id, newName: name)
                        succesToast.toggle()
                    } else {
                        errorToast.toggle()
                    }
                }
            }
        }
        .navigationTitle("Wijzig gebruikersnaam")
        .toast(isPresenting: $succesToast) {
            AlertToast(type: .complete(Color.green), title: "Username updated!")
        }
        .toast(isPresenting: $errorToast) {
            AlertToast(type: .error(Color.red), title: "Invalid username!")
        }
    }
}
