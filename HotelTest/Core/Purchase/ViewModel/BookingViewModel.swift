//
//  BookingViewModel.swift
//  HotelTest
//
//  Created by Alexander V. on 07.09.2023.
//

import Foundation
import SwiftUI
import Combine

final class BookingViewModel: ObservableObject {
    
    @Published var booking: Booking?
    @Published var dataBooking: [OrderModel]
    @Published var totalPrice: Int?
    @Published var listTourist: [Tourist] = [
        Tourist(info: .init(labelTourist: "Первый турист", vm: .init(show: true)))
    ]
    @Published var isMobileValid: Bool = false
    @Published var isShowErrorMobile: Bool = false {
        willSet {
            if newValue { placholderMobile = "Номер телефона введен некорректно" }
        }
    }
    @Published var isEmailValid: Bool = false
    @Published var isShowErrorEmail: Bool = false {
        willSet {
            if newValue { placholderEmail = "Почта введена некорректно" }
        }
    }
    @Published var canDone = false
    @Published var placholderMobile: String = "Номер телефона"
    @Published var placholderEmail: String = "Почта"

    private let dataService: BookingService
    private var cancellables: Set<AnyCancellable>
    
    init(apiBooking: String) {
        cancellables = Set<AnyCancellable>()
        dataBooking = []
        dataService = BookingService(apiBooking: apiBooking)
        addSubscribers()
        setupObservers()
    }
    
    func addTourist() {
        guard listTourist.count < 6 else { return } // Временное ограничение (нет условий в ТЗ на возможное количество туристов)
        
        switch listTourist.count {
        case 1: listTourist.append(.init(info: .init(labelTourist: "Второй турист", vm: .init(show: true))))
        case 2: listTourist.append(.init(info: .init(labelTourist: "Третий турист", vm: .init(show: true))))
        case 3: listTourist.append(.init(info: .init(labelTourist: "Четвертый турист", vm: .init(show: true))))
        case 4: listTourist.append(.init(info: .init(labelTourist: "Пятый турист", vm: .init(show: true))))
        default: break
        }
        
        setupObservers()
    }
    
    func checkTourists() {
        listTourist.forEach { $0.info.vm.checkTextFields() }
        if !isMobileValid { isShowErrorMobile = true }
        if !isEmailValid { isShowErrorEmail = true }
    }
}

private extension BookingViewModel {
    
    func addSubscribers() {
        dataService.$booking
            .sink { [weak self] booking in
                if let booking {
                    self?.booking = booking
                    self?.fillingBookingDetails()
                    self?.totalPrice = booking.tourPrice + booking.fuelCharge + booking.serviceCharge
                }
            }
            .store(in: &cancellables)
    }
    
    func setupObservers() {
        let canPassPublishers = Publishers.MergeMany(
            listTourist.map { $0.info.vm.$canPass }
        )
        
        let combinedPublisher = Publishers.CombineLatest3(
            canPassPublishers,
            $isMobileValid,
            $isEmailValid
        )
        
        combinedPublisher
            .sink(receiveValue: { [weak self] canPass, isMobileValid, isEmailValid in
                self?.updateCanDone(canPass: canPass, isMobileValid: isMobileValid, isEmailValid: isEmailValid)
            })
            .store(in: &cancellables)
    }
    
    func updateCanDone(canPass: Bool, isMobileValid: Bool, isEmailValid: Bool) {
        canDone = canPass && isMobileValid && isEmailValid
    }
    
    func fillingBookingDetails() {
        dataBooking.append(contentsOf: [
            OrderModel(name: "Вылет из"     , value: booking?.departure ?? ""),
            OrderModel(name: "Страна, город", value: booking?.arrivalCountry ?? ""),
            OrderModel(name: "Даты"         , value: "\(booking?.tourDateStart ?? "")" + "-" + "\(booking?.tourDateStop ?? "")"),
            OrderModel(name: "Кол-во ночей" , value: String(booking?.numberOfNights ?? 0)),
            OrderModel(name: "Отель"        , value: booking?.hotelName ?? ""),
            OrderModel(name: "Номер"        , value: booking?.room ?? ""),
            OrderModel(name: "Питание"      , value: booking?.nutrition ?? "")
        ])
    }
}
