//
//  ImageService.swift
//  HotelTest
//
//  Created by Alexander V. on 07.09.2023.
//

import Foundation
import SwiftUI
import Combine

final class ImageService {
    
    @Published var image: UIImage? = nil
    private var imageSubsription: AnyCancellable?
    
    init(urlString: String) {
        getHotelImage(urlString: urlString)
    }
    
    private func getHotelImage(urlString: String) {
        guard let url = URL(string: urlString) else {
            print(NetworkingError.incorrectURL(url: urlString).localizedDescription)
            return
        }
        
        imageSubsription = NetworkManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] image in
                self?.image = image
                self?.imageSubsription?.cancel()
            })
    }
}
