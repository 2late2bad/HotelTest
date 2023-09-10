//
//  Font+Ext.swift
//  HotelTest
//
//  Created by Alexander V. on 06.09.2023.
//

import SwiftUI

extension Font {
    static func custom(_ font: R.CustomFont, size: CGFloat) -> SwiftUI.Font {
        SwiftUI.Font.custom(font.rawValue, size: size)
    }
}
