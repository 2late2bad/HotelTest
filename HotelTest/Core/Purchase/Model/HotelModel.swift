//
//  HotelModel.swift
//  HotelTest
//
//  Created by Alexander V. on 04.09.2023.
//

import Foundation

// MARK: - HotelModel
struct HotelModel: Codable {
    let id: Int
    let name: String
    let adress: String
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let imageUrls: [String]
    let aboutTheHotel: AboutTheHotel
}

// MARK: - AboutTheHotel
struct AboutTheHotel: Codable {
    let description: String
    let peculiarities: [String]
}

// MARK: - Parameter
struct Parameter: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let secondTitle: String
    
    static let instance: [Parameter] = [
        Parameter(image: R.Image.happy,
                  title: "Удобства",
                  secondTitle: "Самое необходимое"),
        Parameter(image: R.Image.tickSquare,
                  title: "Что включено",
                  secondTitle: "Самое необходимое"),
        Parameter(image: R.Image.closeSquare,
                  title: "Что не включено",
                  secondTitle: "Самое необходимое")
    ]
}
