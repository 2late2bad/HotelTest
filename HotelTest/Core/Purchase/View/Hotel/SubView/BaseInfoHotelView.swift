//
//  BaseInfoHotelView.swift
//  HotelTest
//
//  Created by Alexander V. on 04.09.2023.
//

import SwiftUI

struct BaseInfoHotelView: View {
    
    @ObservedObject var vm: HotelViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HImageCarouselView(images: vm.hotel?.imageUrls ?? [])
            
            HMainInfoHotel(name: vm.hotel?.name,
                           address: vm.hotel?.adress,
                           rating: vm.hotel?.rating,
                           ratingName: vm.hotel?.ratingName)
            
            HPriceHotelView(price: vm.hotel?.minimalPrice,
                            priceFor: vm.hotel?.priceForIt)
        }
        .padding(.all, 16)
        .frame(maxWidth: .infinity)
        .background(R.Color.hotelBlockBackground)
    }
}

struct BaseInfoHotelView_Previews: PreviewProvider {
    static var previews: some View {
        BaseInfoHotelView(vm: HotelViewModel(apiHotel: "https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3", apiRooms: "https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd"))
    }
}
