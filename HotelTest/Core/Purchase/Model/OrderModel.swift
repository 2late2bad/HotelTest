//
//  OrderModel.swift
//  HotelTest
//
//  Created by Alexander V. on 07.09.2023.
//

import Foundation

// MARK: - OrderModel
struct OrderModel: Identifiable {
    let id = UUID()
    let name: String
    let value: String
}
