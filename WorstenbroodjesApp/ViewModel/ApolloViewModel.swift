//
//  ApolloViewModel.swift
//  WorstenbroodjesApp
//
//  Created by Dré Van den Hooff on 13/10/2022.
//

import Foundation

class ApolloViewModel: ObservableObject {
    
    @Published private var model = createModel()
    
    var users: [ApolloModel.User] {
        model.users
    }
    
    var loggedInUser: ApolloModel.User {
        model.loggedInUser!
    }
    
    init()  {
        fetchAllUsers()
    }
    
    private static func createModel() -> ApolloModel {
        ApolloModel()
    }
    
    private func mockLogin(id: String) {
        model.mockLogin(id: id)
    }
    x`
    private func fetchAllUsers()  {
        Network.shared.apolloClient.fetch(query: GetAllUsersQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                if let users = graphQLResult.data?.getAllUsers {
                    self.model.processAllUsers(users)
                    self.mockLogin(id: "ea802883-130e-4e0d-ad2c-fed4148af32a")
                } else if let errors = graphQLResult.errors {
                    print(errors)
                }
            case .failure(let error):
                print("Error! \(error)")
            }
        }
    }
    
    func updateUserName(id: String, newName: String) {
        Network.shared.apolloClient.perform(mutation: UpdateUsernameMutation(id: id, newName: newName)) { result in
            switch result {
            case .success:
                print("success")
                // refetch users
            case .failure(let error):
                print("Error! \(error)")
            }
        }
    }
    
    func updateStats(id: String, stats: StatsInput) {
        Network.shared.apolloClient.perform(mutation: UpdateUserStatsMutation(id: id, stats: stats)) { result in
            switch result {
            case .success:
                print("success")
                // refetch users
            case .failure(let error):
                print("Error! \(error)")
            }
        }
    }
}
