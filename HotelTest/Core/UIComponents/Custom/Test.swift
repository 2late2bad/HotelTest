//
//  Test.swift
//  HotelTest
//
//  Created by Alexander V. on 10.09.2023.
//

import SwiftUI

struct PhoneNumberFormatter {
    func formatPhoneNumber(_ phoneNumber: String) -> String {
        var formattedNumber = phoneNumber
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let phoneDigits = phoneNumber.components(separatedBy: allowedCharacters.inverted).joined()

        // Check if the phoneDigits has at least 11 digits
        if phoneDigits.count >= 11 {
            // Extract the first 11 digits
            let startIndex = phoneDigits.index(phoneDigits.startIndex, offsetBy: 0)
            let endIndex = phoneDigits.index(phoneDigits.startIndex, offsetBy: 11)
            let range = startIndex..<endIndex
            let trimmedDigits = phoneDigits[range]
            
            // Format the phone number as per the mask
            formattedNumber = "+7 (\(trimmedDigits.prefix(3))) \(trimmedDigits.dropFirst(3).prefix(3))-\(trimmedDigits.dropFirst(6).prefix(2))-\(trimmedDigits.dropFirst(8).prefix(2))"
        }
        
        return formattedNumber
    }
}
