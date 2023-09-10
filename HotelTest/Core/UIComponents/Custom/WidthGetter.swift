//
//  WidthGetter.swift
//  HotelTest
//
//  Created by Alexander V. on 05.09.2023.
//

import SwiftUI
import Combine

public struct WidthGetter: View {
    
    let widthChanged: PassthroughSubject<CGFloat, Never>
    
    public var body: some View {
        GeometryReader { g -> Path in
            self.widthChanged.send(g.frame(in: .global).width)
            return Path()
        }
    }
}
