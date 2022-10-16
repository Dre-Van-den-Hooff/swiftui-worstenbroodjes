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
    
    private func mockLogin(id: String) {
        model.mockLogin(id: id)
    }
    
    //    func getById(id: String) {
    //        Network.shared.apolloClient.fetch(query: GetUserByIdQuery(id: id)) { result in
    //            switch result {
    //            case .success(let graphQLResult):
    //                if let user = graphQLResult.data?.getById {
    //                      // do stuff
    //                } else if let errors = graphQLResult.errors {
    //                    print(errors)
    //                }
    //            case .failure(let error):
    //                print("Error! \(error)")
    //            }
    //        }
    //    }
}
