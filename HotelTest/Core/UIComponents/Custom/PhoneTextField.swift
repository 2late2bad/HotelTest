//
//  PhoneTextField.swift
//  HotelTest
//
//  Created by Alexander V. on 05.09.2023.
//

import UIKit
import SwiftUI

public struct PhoneTextField: View {
    
    @Binding var text: String
    @Binding var placeholder: String
    
    public var body: some View {
        TextField(placeholder, text: $text)
            .font(.custom(.regular, size: 16))
            .onChange(of: text, perform: { oldValue in
                text = format(with: "+* (***) ***-**-**", phone: oldValue)
            })
            .modifier(TopFloatingHolder(noText: text.isEmpty,
                                        placeHolderKey: placeholder))
            .keyboardType(.numbersAndPunctuation)
            .autocorrectionDisabled()
    }
    
    func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        if !numbers.isEmpty && numbers[numbers.startIndex] != "7" {
            return "7" + numbers
        }
        
        var result = ""
        var index = numbers.startIndex
        
        for ch in mask where index < numbers.endIndex {
            if ch == "*" {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
}
