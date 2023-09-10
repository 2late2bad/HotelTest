//
//  Int+Ext.swift
//  HotelTest
//
//  Created by Alexander V. on 07.09.2023.
//

import Foundation

extension Int {
    var ruNumb: String {
        self.formatted(.number.locale(.init(identifier: "ru_RU")))
    }
}
