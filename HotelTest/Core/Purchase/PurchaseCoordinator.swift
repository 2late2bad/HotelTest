//
//  HotelCoordinator.swift
//  HotelTest
//
//  Created by Alexander V. on 04.09.2023.
//

import UIKit
import SwiftUI

protocol PurchaseRouting {
    func routeRoomView(for hotel: String)
    func routeBookingView()
    func routeOrderView()
}

final class PurchaseCoordinator: Coordinator {
    
    let rootViewController: UINavigationController
    @State private var hotelViewModel: HotelViewModel
    @State private var bookingViewModel: BookingViewModel

    init() {
        rootViewController = UINavigationController()
        rootViewController.navigationBar.isHidden = true
        rootViewController.navigationBar.titleTextAttributes = [
            .font: UIFont(name: R.CustomFont.medium.rawValue, size: 18) ?? .systemFont(ofSize: 18, weight: .medium)
        ]
        
        hotelViewModel = HotelViewModel(
            apiHotel: R.API.hotel,
            apiRooms: R.API.rooms
        )
        bookingViewModel = BookingViewModel(apiBooking: R.API.booking)
    }
    
    func start() {
        let view = HotelView(vm: self.hotelViewModel) { hotel in
            self.routeRoomView(for: hotel)
        }
        let vc = UIHostingController(rootView: view)
        rootViewController.setViewControllers([vc], animated: false)
    }
}

extension PurchaseCoordinator: PurchaseRouting {
    
    func routeRoomView(for hotel: String) {
        let roomView = RoomView(vm: hotelViewModel, titleHotel: hotel) {
            self.rootViewController.popViewController(animated: true)
        } doneRequest: {
            self.routeBookingView()
        }
        let roomVC = UIHostingController(rootView: roomView)
        rootViewController.pushViewController(roomVC, animated: true)
    }
    
    func routeBookingView() {
        UIScrollView.appearance().bounces = false
        let bookingView = BookingView(vm: bookingViewModel) {
            UIScrollView.appearance().bounces = true
            self.rootViewController.popViewController(animated: true)
        } doneRequest: {
            UIScrollView.appearance().bounces = true
            self.routeOrderView()
        }
        let bookingVC = UIHostingController(rootView: bookingView)
        rootViewController.pushViewController(bookingVC, animated: true)
    }
    
    func routeOrderView() {
        let orderView = OrderView {
            UIScrollView.appearance().bounces = false
            self.rootViewController.popViewController(animated: true)
        } doneRequest: {
            self.rootViewController.popToRootViewController(animated: true)
        }
        let orderVC = UIHostingController(rootView: orderView)
        rootViewController.pushViewController(orderVC, animated: true)
    }
}
