//
//  AttributedTextUIView.swift
//  VideoPlayerSwiftUI
//
//  Created by Salar Soleimani on 2024-01-15.
//

import UIKit
import SwiftUI

struct AttributedTextUIView: UIViewRepresentable {
    let attributedText: NSAttributedString

    func makeUIView(context: Context) -> UITextView {
        let label = UITextView()
        return label
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = attributedText
    }
}
