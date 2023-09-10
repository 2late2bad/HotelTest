//
//  Resources.swift
//  HotelTest
//
//  Created by Alexander V. on 06.09.2023.
//

import SwiftUI
import UIKit

typealias R = Resources

enum Resources {
    
    enum API {
        static let hotel = "https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3"
        static let rooms = "https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd"
        static let booking = "https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8"
    }
        
    enum CustomFont: String {
        case regular = "SFProDisplay-Regular"
        case medium = "SFProDisplay-Medium"
        case semibold = "SFProDisplay-Semibold"
        case bold = "SFProDisplay-Bold"
    }
    
    enum Color {
        static let background = SwiftUI.Color.init(hex: "F6F6F9")
        static let buttonBack = SwiftUI.Color.init(hex: "0D72FF")
        static let buttonFore = SwiftUI.Color.init(hex: "FFFFFF")
        static let textFieldBackDefault = SwiftUI.Color.init(hex: "F6F6F9")
        static let textFieldBackError = SwiftUI.Color.init(hex: "EB5757")?.opacity(0.15)
        
        // Hotel base info
        static let hotelRatingForeground = SwiftUI.Color.init(hex: "FFA800")
        static let hotelRatingBackground = SwiftUI.Color.init(hex: "FFC700")?.opacity(0.2)
        static let hotelAddressButton = SwiftUI.Color.init(hex: "0D72FF")
        static let hotelPriceFor = SwiftUI.Color.init(hex: "828796")
        static let hotelBlockBackground = SwiftUI.Color.init(hex: "FFFFFF")
        
        // Hotel detailed info
        static let tagBackground = SwiftUI.Color.init(hex: "FBFBFC")
        static let tagForeground = SwiftUI.Color.init(hex: "828796")
        
        // Room cell
        static let roomBackground = SwiftUI.Color.init(hex: "FFFFFF")
        static let moreInfoButtonBackground = SwiftUI.Color.init(hex: "0D72FF")?.opacity(0.1)
        static let moreInfoButtonForeground = SwiftUI.Color.init(hex: "0D72FF")
        
        // Booking view
        static let nameTextBooking = SwiftUI.Color.init(hex: "828796")
        static let valueTextBooking = SwiftUI.Color.init(hex: "000000")
        static let resultTextBooking = SwiftUI.Color.init(hex: "0D72FF")
        static let buyerInfo = SwiftUI.Color.init(hex: "828796")
        
        // Tourist view
        static let showButtonForeground = SwiftUI.Color.init(hex: "0D72FF")
        static let showButtonBackground = SwiftUI.Color.init(hex: "0D72FF")?.opacity(0.1)
        
        // Order view
        static let orderBackground = SwiftUI.Color.init(hex: "F6F6F9")
        static let orderInfoText = SwiftUI.Color.init(hex: "828796")
    }
    
    enum Image {
        static let happy = "emoji-happy"
        static let closeSquare = "close-square"
        static let tickSquare = "tick-square"
        static let party = "partyPopper"
    }
}
