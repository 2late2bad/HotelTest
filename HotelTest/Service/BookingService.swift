//
//  BookingService.swift
//  HotelTest
//
//  Created by Alexander V. on 07.09.2023.
//

import Foundation
import Combine

final class BookingService {
    
    @Published var booking: Booking?
    var bookingSubsription: AnyCancellable?
    
    private let decoder: JSONDecoder
    
    init(apiBooking: String) {
        decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        getBooking(for: apiBooking)
    }
    
    private func getBooking(for curl: String) {
        guard let url = URL(string: curl) else {
            print(NetworkingError.incorrectURL(url: curl).localizedDescription)
            return
        }
        
        bookingSubsription = NetworkManager.download(url: url)
            .decode(type: Booking.self, decoder: decoder)
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] booking in
                self?.booking = booking
                self?.bookingSubsription?.cancel()
            })
    }
}
