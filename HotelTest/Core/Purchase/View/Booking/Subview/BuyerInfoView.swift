//
//  BuyerInfoView.swift
//  HotelTest
//
//  Created by Alexander V. on 05.09.2023.
//

import SwiftUI

struct BuyerInfoView: View {
    
    @ObservedObject var vm: BookingViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Информация о покупателе")
                .font(.custom(.medium, size: 22))
            
            VStack(alignment: .leading, spacing: 8) {
                HMobileTextField(vm: vm)
                HEmailTextField(vm: vm)
                Text("Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту")
                    .foregroundColor(R.Color.buyerInfo)
                    .font(.custom(.regular, size: 14))
            }
        }
    }
}

//struct BuyerInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        BuyerInfoView()
//    }
//}
