//
//  LeaderboardView.swift
//  WorstenbroodjesApp
//
//  Created by Dré Van den Hooff on 12/10/2022.
//

import SwiftUI
import AlertToast

struct LeaderboardView: View {
    
    @EnvironmentObject var apolloViewModel: ApolloViewModel
    @Environment(\.colorScheme) var colorScheme
    
    @State private var showSheet = false
    @State private var amount = 1
    @State private var foodSelection: Food = .worstenbroodje
    @State private var succesToast = false
    
    var body: some View {
        VStack {
            ZStack {
                Image("background2")
                    .resizable()
                    .cornerRadius(24)
                    .ignoresSafeArea()

                VStack {
                    heading
                    buttonGroup
                    topThree
                    Spacer()
                }
            }
            userList
        }
    }
    
    private var heading: some View {
        HStack {
            Button {
                showSheet.toggle()
            } label: {
                Image(systemName: "cart")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.horizontal)
            }
            .sheet(isPresented: $showSheet) {
                sheetContent
                    .presentationDetents([.large, .medium, .fraction(0.75)])
                    .preferredColorScheme(colorScheme)
            }
            
            Spacer()
            
            Text("Leaderboard")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
                .foregroundColor(.black)
            Spacer()
            Spacer()
        }
    }
    
    private var buttonGroup: some View {
        HStack {
            Picker("", selection: $foodSelection) {
                Text("Worstenbroodjes").tag(Food.worstenbroodje)
                Text("Panini's").tag(Food.panini)
                Text("Pizza's").tag(Food.pizza)
            }
            .pickerStyle(.segmented)
            .padding([.horizontal, .bottom])
        }
    }
    
    private var userList: some View {
        ScrollView {
            ForEach(Array(getSortedBy(foodSelection).enumerated()), id: \.offset) { index, user in
                HStack(alignment: .bottom) {
                    
                    Text("\(index + 1).")
                        .padding()
                    
                    Spacer()
                    
                    Text(user.username)
                        .padding()
                    
                    Spacer()
                    
                    getStats(of: foodSelection, user)
                        .padding()
                    
                }
                .background(RoundedRectangle(cornerRadius: 8)
                    .fill(isLightTheme() ? .white : .spacegray)
                    .shadow(color: isLightTheme() ? .black.opacity(0.1) : .white.opacity(0.4), radius: 2, x: 0, y: 5)
                )
                .padding([.top, .leading, .trailing])
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal)
        .toast(isPresenting: $succesToast) {
            AlertToast(type: .complete(Color.green), title: "Stats updated!")
        }
    }
    
    private var topThree: some View {
        HStack {
            ForEach(Array(getTopThree(foodSelection).enumerated()), id: \.offset) { index, user in
                Spacer()
                PositionView(position: index + 1, name: user.username)
                Spacer()
            }
        }
        .padding(.vertical)
    }
    
    private var sheetContent: some View {
        Form {
            Section {
                Picker("Kies een snack", selection: $foodSelection) {
                    Text("Worstenbroodje").tag(Food.worstenbroodje)
                    Text("Panini").tag(Food.panini)
                    Text("Pizza").tag(Food.pizza)
                }
                .pickerStyle(.menu)
            }
            
            Section {
                Stepper("Aantal: \(amount)", value: $amount, in: 1...10)
            }
            
            HStack {
                Button("Annuleren") {
                    showSheet.toggle()
                }
                
                Spacer()
                
                Button("Bevestigen") {
                    
                    let worstenbroodjes = foodSelection == .worstenbroodje ? apolloViewModel.loggedInUser.stats.worstenbroodjes + amount : apolloViewModel.loggedInUser.stats.worstenbroodjes
                    
                    let paninis = foodSelection == .panini ? apolloViewModel.loggedInUser.stats.paninis + amount : apolloViewModel.loggedInUser.stats.paninis
                    
                    let pizzas = foodSelection == .pizza ? apolloViewModel.loggedInUser.stats.pizzas + amount : apolloViewModel.loggedInUser.stats.pizzas
                    
                    let updatedStats = StatsInput(totalSpent: 0, worstenbroodjes: worstenbroodjes, pizzas: pizzas, muffins: 0, paninis: paninis)
                    
                    // GraphQL mutation to update stats
                    apolloViewModel.updateStats(id: apolloViewModel.loggedInUser.id, stats: updatedStats)
                    
                    // Close sheet, show succes toast
                    showSheet.toggle()
                    succesToast.toggle()
                }
            }
            .buttonStyle(.borderless)
        }
    }
    
    private func getStats(of selection: Food, _ user: ApolloModel.User) -> Text {
        switch selection {
        case .worstenbroodje:
            return Text(String(user.stats.worstenbroodjes))
        case .panini:
            return Text(String(user.stats.paninis))
        case .pizza:
            return Text(String(user.stats.pizzas))
        default:
            return Text("")
        }
    }
    
    private func getSortedBy(_ selection: Food) -> [ApolloModel.User] {
        apolloViewModel.getSortedBy(selection)
    }
    
    private func getTopThree(_ selection: Food) -> [ApolloModel.User] {
        Array(getSortedBy(selection).prefix(3))
    }
    
    private func isLightTheme() -> Bool {
        colorScheme == .light
    }
}


struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
            .environmentObject(ApolloViewModel())
    }
}

extension Color {
    static let spacegray = Color(red: 79 / 255.0, green: 91 / 255.0, blue: 102 / 255.0)
}

