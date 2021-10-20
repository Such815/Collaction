//
//  CustomTextField.swift
//  Collaction
//
//  Created by Suchira  on 2021-10-16.
//

import Foundation
import SwiftUI

struct customTextField : ViewModifier {
    var cornerRadius: CGFloat
    var backgroundColor: Color
    var textColor: Color
    var padding: CGFloat
    //var font: Font
    var width: CGFloat
    var height: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding(padding)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .foregroundColor(textColor)
            .frame(width: width, height: height)
            .font(.title2)
    }
}
