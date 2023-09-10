//
//  TopFloatingHolderModifier.swift
//  HotelTest
//
//  Created by Alexander V. on 05.09.2023.
//

import SwiftUI

public struct TopFloatingHolder: ViewModifier {
    
    let noText: Bool
    let placeHolderKey: String
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            Text(placeHolderKey)
                .offset(x: 0, y: noText ? 0 : -18)
                .font(.system(size: noText ? 16 : 12))
                .foregroundColor(.black.opacity(noText ? 0.0 : 0.6))
            
            content
        }
        .animation(.easeOut(duration: 0.4), value: noText)
    }
}
