//
//  Blur.swift
//  WeAreMatchPlay_Kiko
//
//  Created by mac on 19/01/2021.
//

import SwiftUI
// fullscreen blur View to lay under an alert
struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .regular
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
