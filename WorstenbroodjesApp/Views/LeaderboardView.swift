//
//  LeaderboardView.swift
//  WorstenbroodjesApp
//
//  Created by Dré Van den Hooff on 12/10/2022.
//

import SwiftUI

struct LeaderboardView: View {
    @State private var selection: Int? = 1
    @EnvironmentObject var apolloViewModel: ApolloViewModel
    
    var body: some View {
        VStack {
            heading
            buttonGroup
            topThree
            Spacer()
            userList
            Spacer()
        }
    }
    
    private var buttonGroup: some View {
        HStack {
            Picker("", selection: $selection) {
                Text("Worstenbroodjes").tag(1 as Int?)
                Text("Panini's").tag(2 as Int?)
                Text("Pizza's").tag(3 as Int?)
            }
            .pickerStyle(SegmentedPickerStyle())
            .buttonStyle(PlainButtonStyle())
            .padding(.horizontal)
        }
    }
    
    private var heading: some View {
        HStack {
            Image(systemName: "cart")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.horizontal)
                .onTapGesture {
                    // TODO
                    // open drawer
                }
            
            Spacer()
            
            Text("Leaderboard")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            Spacer()
            Spacer()
        }
    }
    
    private var userList: some View {
        ScrollView {
            ForEach(Array(getSortedBy(selection!).enumerated()), id: \.offset) { index, user in
                HStack(alignment: .bottom) {
                    
                    Text(String(index + 1))
                        .padding()
                    
                    Spacer()
                    
                    Text(user.username)
                        .padding()
                    
                    Spacer()
                    
                    getStats(of: selection!, user)
                        .padding()
                    
                }
                .background(RoundedRectangle(cornerRadius: 8)
                    .fill(Color(.white))
                    .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 5)
                )
                .padding([.top, .leading, .trailing])
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal)
    }
    
    private var topThree: some View {
        HStack {
            
            ForEach(getTopThree(selection!)) { user in
                Text(user.username)
            }
 
        }
    }
    
    private func getStats(of selection: Int, _ user: ApolloModel.User) -> Text {
        switch selection {
        case 1:
            return Text(String(user.stats.worstenbroodjes))
        case 2:
            return Text(String(user.stats.paninis))
        case 3:
            return Text(String(user.stats.pizzas))
        default:
            return Text("")
        }
    }
    
    private func getSortedBy(_ selection: Int) -> [ApolloModel.User] {
        switch selection {
        case 1:
            return apolloViewModel.users.sorted { (a, b) in
                a.stats.worstenbroodjes > b.stats.worstenbroodjes
            }
        case 2:
            return apolloViewModel.users.sorted { (a, b) in
                a.stats.paninis > b.stats.paninis
            }
        case 3:
            return apolloViewModel.users.sorted { (a, b) in
                a.stats.pizzas > b.stats.pizzas
            }
        default:
            // Should never happen
            return apolloViewModel.users
        }
    }
    
    private func getTopThree(_ selection: Int) -> [ApolloModel.User] {
        Array(getSortedBy(selection).prefix(3))
    }
    
}


struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
            .environmentObject(ApolloViewModel())
    }
}
