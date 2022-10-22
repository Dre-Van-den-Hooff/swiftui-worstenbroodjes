//
//  ChangeUsernameView.swift
//  WorstenbroodjesApp
//
//  Created by Dré Van den Hooff on 16/10/2022.
//

import SwiftUI
import AlertToast

struct ChangeUsernameView: View {
    @State private var name: String = ""
    @State private var succesToast = false
    @EnvironmentObject var apolloViewModel: ApolloViewModel

    var body: some View {
        Form {
            Section {
                TextField("Nieuwe gebruikersnaam", text: $name)
     
                Button("Bevestigen") {
                    apolloViewModel.updateUserName(id: apolloViewModel.loggedInUser.id, newName: name)
                    succesToast.toggle()
                }
            }
        }
        .navigationTitle("Wijzig gebruikersnaam")
        .toast(isPresenting: $succesToast) {
            AlertToast(type: .complete(Color.green), title: "Username updated!")
        }
    }
}

struct ChangeUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeUsernameView()
            .environmentObject(ApolloViewModel())
    }
}
