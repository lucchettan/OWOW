//
//  BackGroundWhite.swift
//  WeAreMatchPlay_Kiko
//
//  Created by mac on 19/01/2021.
//

import SwiftUI

import SwiftUI

struct BackGroundWhite: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            VStack{
                HStack {
                    Image("golf")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.47, height: UIScreen.main.bounds.height * 0.45)
                        .blur(radius: 2)
                    Spacer()
                }.offset(x: -UIScreen.main.bounds.width * 0.05, y: UIScreen.main.bounds.height * 0.1)
            }
            VStack{
                HStack {
                    Spacer()
                    Image("golf-stick-2")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.4)
                        .blur(radius: 4)
                }.offset(x: UIScreen.main.bounds.width * 0.35, y: -UIScreen.main.bounds.height * 0.1)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct BackGroundWhite_Previews: PreviewProvider {
    static var previews: some View {
        BackGroundWhite()
    }
}
