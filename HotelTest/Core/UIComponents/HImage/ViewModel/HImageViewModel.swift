//
//  HImageViewModel.swift
//  HotelTest
//
//  Created by Alexander V. on 07.09.2023.
//

import Foundation
import UIKit
import Combine

final class HImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let dataService: ImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(urlString: String) {
        self.dataService = ImageService(urlString: urlString)
        addSubsribers()
        self.isLoading = true
    }
    
    private func addSubsribers() {
        dataService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                if let returnedImage {
                    self?.image = returnedImage
                } else {
                    self?.isLoading = false
                }
            }
            .store(in: &cancellables)
    }
}
