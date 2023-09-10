//
//  HotelViewModel.swift
//  HotelTest
//
//  Created by Alexander V. on 06.09.2023.
//

import Foundation
import SwiftUI
import Combine

final class HotelViewModel: ObservableObject {
    
    @Published var hotel: HotelModel?
    @Published var images: [String]?
    @Published var rooms: [Room]
    
    private let dataService: HotelService
    private var cancellables: Set<AnyCancellable>
    
    init(apiHotel: String, apiRooms: String) {
        cancellables = Set<AnyCancellable>()
        rooms = []
        dataService = HotelService(apiHotel: apiHotel, apiRooms: apiRooms)
        addSubsribers()
    }
    
    func reloadData() {
        hotel = nil
        images = nil
        cancellables.removeAll()
        dataService.reloadData()
        addSubsribers()
    }
    
    private func addSubsribers() {
        dataService.$hotel
            .sink { [weak self] hotel in
                self?.hotel = hotel
                self?.images = hotel?.imageUrls
            }
            .store(in: &cancellables)
        
        dataService.$rooms
            .sink { [weak self] rooms in
                self?.rooms = rooms?.rooms ?? []
            }
            .store(in: &cancellables)
    }
}
