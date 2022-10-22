//
//  PositionView.swift
//  WorstenbroodjesApp
//
//  Created by Dré Van den Hooff on 20/10/2022.
//

import SwiftUI

struct PositionView: View {
    
    var position: Int
    var name: String
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 70, height: 70)
                    .foregroundColor(.blue)
                
                switch position {
                case 1:
                    Image("gold")
                        .resizable()
                        .frame(width: 70, height: 70)
                case 2:
                    Image("silver")
                        .resizable()
                        .frame(width: 70, height: 70)
                case 3:
                    Image("bronze")
                        .resizable()
                        .frame(width: 70, height: 70)
                default:
                    Text("")
                }
            }
            Text(name)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold))
        }
    }
}
