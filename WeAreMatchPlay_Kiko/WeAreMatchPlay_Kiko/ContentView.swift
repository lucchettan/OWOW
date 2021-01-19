//
//  ContentView.swift
//  WeAreMatchPlay_Kiko
//
//  Created by mac on 19/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State var apiToken : String?
    // The app verify in the Scene Delegate for the presence of a token at launch
    
    @State var isLoggedIn = false
    // To switch between login and feed
 
    @State var nextMatches: [String] = [ ]
    var body: some View {
        VStack{
            if self.isLoggedIn || apiToken != "" && apiToken != nil {
                VStack {
                    FeedTitleView()
                    ScrollView {
                        ForEach(0 ..< 3) {_ in
                            MatchView()
                                .padding(.vertical, 30)
                        }
                    }
                }
            } else {
                loggingView(isLoggedIn: self.$isLoggedIn)
            }
        }
        .animation(.spring())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(isLoggedIn: false)
    }
}
