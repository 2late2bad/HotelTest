//
//  TotalPriceView.swift
//  HotelTest
//
//  Created by Alexander V. on 05.09.2023.
//

import SwiftUI

struct TotalPriceView: View {
    
    @ObservedObject var vm: BookingViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            HPriceStack(name: "Тур", value: vm.booking?.tourPrice, isResult: false)
            HPriceStack(name: "Топливный сбор", value: vm.booking?.fuelCharge, isResult: false)
            HPriceStack(name: "Сервисный сбор", value: vm.booking?.serviceCharge, isResult: false)
            HPriceStack(name: "К оплате", value: vm.totalPrice, isResult: true)
        }
    }
}

struct TotalPriceView_Previews: PreviewProvider {
    static var previews: some View {
        TotalPriceView(vm: .init(apiBooking: "https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8"))
    }
}
