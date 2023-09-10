//
//  HotelService.swift
//  HotelTest
//
//  Created by Alexander V. on 06.09.2023.
//

import Foundation
import Combine

final class HotelService {
    
    @Published var hotel: HotelModel?
    @Published var rooms: RoomModel?
    var hotelSubscription: AnyCancellable?
    var roomsSubscription: AnyCancellable?
    
    private let decoder: JSONDecoder
    private let apiHotel: String
    private let apiRooms: String
    
    init(apiHotel: String, apiRooms: String) {
        self.apiHotel = apiHotel
        self.apiRooms = apiRooms
        
        decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        getHotel(for: apiHotel)
        getRooms(for: apiRooms)
    }
    
    func reloadData() {
        hotel = nil
        rooms = nil
        getHotel(for: apiHotel)
        getRooms(for: apiRooms)
    }
    
    private func getHotel(for curl: String) {
        guard let url = URL(string: curl) else {
            print(NetworkingError.incorrectURL(url: curl).localizedDescription)
            return
        }
        
        hotelSubscription = NetworkManager.download(url: url)
            .decode(type: HotelModel.self, decoder: decoder)
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] hotel in
                self?.hotel = hotel
                self?.hotelSubscription?.cancel()
            })
    }
    
    private func getRooms(for curl: String) {
        guard let url = URL(string: curl) else {
            print(NetworkingError.incorrectURL(url: curl).localizedDescription)
            return
        }
        
        roomsSubscription = NetworkManager.download(url: url)
            .decode(type: RoomModel.self, decoder: decoder)
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] rooms in
                self?.rooms = rooms
                self?.roomsSubscription?.cancel()
            })
    }
}
