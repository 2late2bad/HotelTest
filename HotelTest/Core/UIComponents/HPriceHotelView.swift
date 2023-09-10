//
//  HPriceHotelView.swift
//  HotelTest
//
//  Created by Alexander V. on 04.09.2023.
//

import SwiftUI

struct HPriceHotelView: View {
    
    let price: Int?
    let priceFor: String?
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 8) {
            if let price, let priceFor {
                Text("от \(price.ruNumb) ₽")
                    .font(.custom(.semibold, size: 30))
                Text(priceFor.lowercased())
                    .font(.custom(.regular, size: 16))
                    .foregroundColor(R.Color.hotelPriceFor)
            }
        }
    }
}

struct HPriceHotelView_Previews: PreviewProvider {
    static var previews: some View {
        HPriceHotelView(price: 123666, priceFor: "за тур без перелета")
    }
}
