//
//  AppCoordinator.swift
//  HotelTest
//
//  Created by Alexander V. on 04.09.2023.
//

import UIKit
import SwiftUI

final class AppCoordinator: Coordinator {
    
    let window: UIWindow
    var childCoordinators: [Coordinator]
    
    init(window: UIWindow) {
        self.window = window
        window.makeKeyAndVisible()
        childCoordinators = []
    }
    
    func start() {
        let purchaseCoordinator = PurchaseCoordinator()
        purchaseCoordinator.start()
        self.childCoordinators = [purchaseCoordinator]
        self.window.rootViewController = purchaseCoordinator.rootViewController
    }
}
