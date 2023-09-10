//
//  TouristModel.swift
//  HotelTest
//
//  Created by Alexander V. on 08.09.2023.
//

import Foundation

// MARK: - TouristModel
struct Tourist: Identifiable {
    let id = UUID()
    let info: TouristsInfoView
}
