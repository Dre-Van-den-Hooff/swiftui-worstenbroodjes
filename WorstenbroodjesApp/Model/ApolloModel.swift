//
//  ApolloModel.swift
//  WorstenbroodjesApp
//
//  Created by Dré Van den Hooff on 13/10/2022.
//

import Foundation

typealias UserData = GetAllUsersQuery.Data.GetAllUser

struct ApolloModel: Decodable {
    var users: [User] = []
    var loggedInUser: User?
    
    mutating func processAllUsers(_ users: [UserData]) -> Void {
        self.users = users.map { user in
            User(user)
        }
    }
    
    mutating func mockLogin(id: String) -> Void {
        self.loggedInUser = users.first { $0.id == id }
    }
    
    struct User: Identifiable, Decodable {
        var id: String
        var username: String
        var stats: Stats
        
        init(_ user: UserData) {
            self.id = user.id
            self.username = user.username
            self.stats = Stats(user.stats!)
        }
        
        struct Stats: Decodable {
            var worstenbroodjes: Int
            var pizzas: Int
            var paninis: Int
            
            init(_ stats: UserData.Stat) {
                self.worstenbroodjes = stats.worstenbroodjes
                self.paninis = stats.paninis
                self.pizzas = stats.pizzas
            }
        }
    }
}

