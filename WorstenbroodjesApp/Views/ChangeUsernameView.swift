//
//  ChangeUsernameView.swift
//  WorstenbroodjesApp
//
//  Created by Dré Van den Hooff on 16/10/2022.
//

import SwiftUI

struct ChangeUsernameView: View {
    @State private var name: String = ""
    @EnvironmentObject var apolloViewModel: ApolloViewModel

    var body: some View {
        Form {
            TextField("Nieuwe gebruikersnaam", text: $name)
 
            Button("Bevestigen") {
                // TODO: show success / error toast
                apolloViewModel.updateUserName(id: apolloViewModel.loggedInUser.id, newName: name)
            }
        }
        .navigationTitle("Verander je gebruikersnaam")
    }
}

struct ChangeUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeUsernameView()
            .environmentObject(ApolloViewModel())
    }
}
