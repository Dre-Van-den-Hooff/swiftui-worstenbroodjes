//
//  ApolloViewModel.swift
//  WorstenbroodjesApp
//
//  Created by Dré Van den Hooff on 13/10/2022.
//

import Foundation
import SwiftUI

class ApolloViewModel: ObservableObject {
    
    @Published private var model = createModel()
    @Published var currentScheme: ColorScheme = .light
    
    var users: [ApolloModel.User] {
        model.users
    }
    
    var loggedInUser: ApolloModel.User {
        model.loggedInUser!
    }
    
    init() {
        fetchAllUsers()
    }
    
    private static func createModel() -> ApolloModel {
        ApolloModel()
    }
    
    private func mockLogin(id: String) {
        model.mockLogin(id: id)
    }
    
    
    // Sort users based on selected food
    func getSortedBy(_ selection: Food) -> [ApolloModel.User] {
        switch selection {
        case .worstenbroodje:
            return users.sorted { (a, b) in
                a.stats.worstenbroodjes > b.stats.worstenbroodjes
            }
        case .panini:
            return users.sorted { (a, b) in
                a.stats.paninis > b.stats.paninis
            }
        case .pizza:
            return users.sorted { (a, b) in
                a.stats.pizzas > b.stats.pizzas
            }
        default:
            return users
        }
    }
    
    
    // Toggle dark/light mode
    func toggleColorScheme(to chosenScheme: ColorScheme) -> Void {
        currentScheme = chosenScheme
    }
    
    
    // MARK: -- API Calls
    
    // Fetch all users [query]
    func fetchAllUsers() {
        Network.shared.apolloClient.fetch(query: GetAllUsersQuery(), cachePolicy: .fetchIgnoringCacheData) { result in
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
    
    
    // Update username [mutation]
    func updateUserName(id: String, newName: String) {
        Network.shared.apolloClient.perform(mutation: UpdateUsernameMutation(id: id, newName: newName)) { result in
            switch result {
            case .success:
                // Refetch users
                self.fetchAllUsers()
            case .failure(let error):
                print("Error! \(error)")
            }
        }
    }
    
    
    // Update user stats [mutation]
    func updateStats(id: String, stats: StatsInput) {
        Network.shared.apolloClient.perform(mutation: UpdateUserStatsMutation(id: id, stats: stats)) { result in
            switch result {
            case .success:
                // Refresh users
                self.fetchAllUsers()
            case .failure(let error):
                print("Error! \(error)")
            }
        }
    }
}
