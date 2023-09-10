//
//  HHotelRatingView.swift
//  HotelTest
//
//  Created by Alexander V. on 04.09.2023.
//

import SwiftUI

struct HHotelRatingView: View {
    
    let rating: Int?
    let ratingName: String
    
    var body: some View {
        HStack(spacing: 2) {
            if let rating {
                Image(systemName: "star.fill")
                Text("\(rating) \(ratingName)")
                    .font(.custom(.medium, size: 16))
            }
        }
        .foregroundColor(R.Color.hotelRatingForeground)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(R.Color.hotelRatingBackground)
        .cornerRadius(5)
    }
}

struct HHotelRatingView_Previews: PreviewProvider {
    static var previews: some View {
        HHotelRatingView(rating: 4, ratingName: "Хорошо")
    }
}
