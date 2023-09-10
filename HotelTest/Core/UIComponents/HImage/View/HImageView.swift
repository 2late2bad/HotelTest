//
//  HImageView.swift
//  HotelTest
//
//  Created by Alexander V. on 07.09.2023.
//

import SwiftUI
import UIKit

struct HImageView: View {
    
    @StateObject var vm: HImageViewModel
    
    init(url: String) {
        _vm = StateObject(wrappedValue: HImageViewModel(urlString: url))
    }
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.2)
            
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .ignoresSafeArea()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct HImageView_Previews: PreviewProvider {
    static var previews: some View {
        HImageView(url: "https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
