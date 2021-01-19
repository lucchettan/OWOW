//
//  MatchView.swift
//  WeAreMatchPlay_Kiko
//
//  Created by mac on 19/01/2021.
//

import SwiftUI

struct MatchView: View {
    var topRightText = "2&1"
    var homePlayer = "T. Pieters"
    var versusPlayer = "A. Achternaam"
    
    var imageMatch = UIImage(named: "beast")
    var clubName = "Millenium Golf Club"
    var date     = "02.03.2042"
    var description = "I beat him so hard, it's not even funny anymore. Get this man a new putter."
    var screenSize = UIScreen.main.bounds
    var body: some View {
        VStack {
            VStack {
                HStack {
                    // the two rctangle up
                    Spacer()
                        .frame(width: (screenSize.width / 2))
                    
                    Text(topRightText)
                        .font(.title)
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: (screenSize.width / 2) + 1, height: 50)
                        .background(Color.blue)
                }
                HStack (spacing: -2){
                    Text(homePlayer)
                        .frame(width: (screenSize.width / 2) , height: 50)
                        .border(Color.gray.opacity(0.5), width: 1)
                    
                    Text(homePlayer)
                        .frame(width: (screenSize.width / 2), height: 50)
                        .border(Color.gray.opacity(0.5), width: 1)
                }
                HStack {
                    // the points
                    ForEach(0 ..< 7) {_ in
                        Circle()
                            .frame(width: 15)
                            .foregroundColor(.yellow)
                    }
                }
                .frame(height: 50)
                
            }
            Image(uiImage: UIImage(named: "golf")!)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: UIScreen.main.bounds.width,maxHeight:  UIScreen.main.bounds.width / 1.7, alignment: .center)
                .padding(.vertical)
            
            HStack{
                // Text  name left space and date on the right
                Text(clubName)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                Text(date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .frame(width: screenSize.width * 0.90,height: 40)
            .padding(.horizontal, 15)
            
            Text(description)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .truncationMode(.tail)
                .font(.callout)
                .frame(width: screenSize.width * 0.93,height: 60)
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width,height: 1.2)
                .foregroundColor(.gray)
                .opacity(0.5)
                .offset(y: -5)
            
            HStack {
                // like comment and verified composant on the left
                // three dot on the right
                SmallItemView(image: "suit.heart.fill", text: "112", color: .red)
                    .frame(width: 50)
                SmallItemView(image: "bubble.left", text: "10", color: .black)
                    .frame(width: 50)
                SmallItemView(image: "checkmark.circle.fill", text: "Verified", color: .green).foregroundColor(.green)
                Spacer()
                Circle()
                    .frame(width: 5, height: 5)
                    .foregroundColor(.gray)
                Circle()
                    .frame(width: 5, height: 5)
                    .foregroundColor(.gray)
                Circle()
                    .frame(width: 5, height: 5)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        
        .frame(width: screenSize.width * 0.95, height: screenSize.height * 0.7)
        .cornerRadius(25)
        .background(
            Color.white
                .cornerRadius(25)
                .shadow(color: Color.gray.opacity(0.7), radius: 20, x: 0, y: 0)
                .ignoresSafeArea()
        )
    
//        .foregroundColor(.primary)
        
    }
}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView()
    }
}
