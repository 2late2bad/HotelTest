//
//  RoomModel.swift
//  HotelTest
//
//  Created by Alexander V. on 07.09.2023.
//

import Foundation

// MARK: - RoomModel
struct RoomModel: Codable {
    let rooms: [Room]
}

// MARK: - Room
struct Room: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]
}
