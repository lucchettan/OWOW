//
//  WrongLog.swift
//  WeAreMatchPlay_Kiko
//
//  Created by mac on 19/01/2021.
//
import SwiftUI

struct WrongLog : View {
    @Binding var isPresented : Bool
    @State var alertMessage  : String
    
    var body: some View {
        VStack{
            ZStack{
                VStack(spacing: 15){
                    Text("Unable to complete")
                        .bold()
                        .font(.system(size: 24))
                        .foregroundColor(Color(#colorLiteral(red: 0.1862579584, green: 0.1104152128, blue: 0.1121566221, alpha: 1)))
                    Text(self.alertMessage)
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    HStack {
                        Button(action: {self.isPresented = false }){
                            Image(systemName: "arrow.uturn.left.square")
                                .font(.system(size: 40))
                                .foregroundColor(Color(#colorLiteral(red: 0.8676875234, green: 0.5789795518, blue: 0.314088136, alpha: 1)))
                        }.padding(.top, 15)
                    }
                }
                .padding(20)
                .background(Color(#colorLiteral(red: 0.8872029185, green: 0.7698594928, blue: 0.6743299365, alpha: 1)).cornerRadius(15))
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.2), radius: 20, x: -10, y: 15)
            }
            .fixedSize(horizontal: false, vertical: true)
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.45)
        }
    }
}
