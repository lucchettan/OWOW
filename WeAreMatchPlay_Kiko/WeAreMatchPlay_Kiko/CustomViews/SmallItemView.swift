//
//  SmallItemView.swift
//  WeAreMatchPlay_Kiko
//
//  Created by mac on 19/01/2021.
//

import SwiftUI

struct SmallItemView: View {
    var image : String
    var text : String
    var color : Color
    var body: some View {
        HStack (alignment: .center, spacing: -5){
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(color)
            Text(text)
                .font(.caption)
                .frame(height: 20)
                .frame(maxWidth: 80)
        }
    }
}
