//
//  FeedTitleView.swift
//  WeAreMatchPlay_Kiko
//
//  Created by mac on 19/01/2021.
//

import SwiftUI

struct FeedTitleView: View {
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Text("Welcome to")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            HStack{
                Text("We Are")
                    .font(.largeTitle)
                    .bold()
                Text("Match Play")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
        .padding(.vertical)
    }
}

struct FeedTitleView_Previews: PreviewProvider {
    static var previews: some View {
        FeedTitleView()
    }
}
