//
//  HMainInfoHotel.swift
//  HotelTest
//
//  Created by Alexander V. on 05.09.2023.
//

import SwiftUI

struct HMainInfoHotel: View {
        
    let name: String?
    let address: String?
    let rating: Int?
    let ratingName: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HHotelRatingView(rating: rating,
                             ratingName: ratingName ?? "UNKNOWN")
            
            Text(name ?? "unknown hotel")
                .font(.custom(.medium, size: 22))
            
            Button {} label: {
                Text(address ?? "unknown address")
                    .font(.custom(.medium, size: 14))
                    .foregroundColor(R.Color.hotelAddressButton)
                Spacer()
            }
        }
    }
}

//struct HMainInfoHotel_Previews: PreviewProvider {
//    static var previews: some View {
//        HMainInfoHotel()
//    }
//}
