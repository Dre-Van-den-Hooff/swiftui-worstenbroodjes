//
//  Network.swift
//  WorstenbroodjesApp
//
//  Created by Dré Van den Hooff on 13/10/2022.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    let url = "https://worstenbroodjes-api-production.up.railway.app/"
    
    private(set) lazy var apolloClient = ApolloClient(url: URL(string: url)!) 
}
