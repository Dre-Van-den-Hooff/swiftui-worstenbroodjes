//
//  ProfileView.swift
//  WorstenbroodjesApp
//
//  Created by Dré Van den Hooff on 12/10/2022.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var apolloViewModel: ApolloViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Profiel")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                HStack {
                    Text("Welkom, \(apolloViewModel.loggedInUser.username)")
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .font(.title)
                        .frame(maxWidth:.infinity, alignment: .leading)
                }
                .padding(.vertical)
                
                VStack {
                    Text("Jouw statistieken")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    Spacer()
                    
                    Group {
                        Image("worstenbroodje")
                            .resizable()
                            .frame(width: 100, height: 75)
                            .padding(.top)
                        Text(String(apolloViewModel.loggedInUser.stats.worstenbroodjes))
                        
                        Divider()
                            .padding(.horizontal)
                        
                        Image("panini")
                            .resizable()
                            .frame(width: 100, height: 60)
                        Text(String(apolloViewModel.loggedInUser.stats.paninis))
                        
                        
                        Divider()
                            .padding(.horizontal)
                        
                        Image("pizza")
                            .resizable()
                            .frame(width: 100, height: 100)
                        Text(String(apolloViewModel.loggedInUser.stats.pizzas))
                        
                        Spacer()
                    }
                }
                Spacer()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(ApolloViewModel())
    }
}
