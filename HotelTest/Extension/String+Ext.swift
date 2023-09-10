//
//  String+Ext.swift
//  HotelTest
//
//  Created by Alexander V. on 10.09.2023.
//

import Foundation

extension Int {
    static var randomOrder: String {
        String(Range(100000...999999).randomElement()!)
    }
}
