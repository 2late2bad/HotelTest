//
//  HHotelParameterView.swift
//  HotelTest
//
//  Created by Alexander V. on 04.09.2023.
//

import SwiftUI

struct HHotelParameterView: View {
    
    let image: String
    let mainLabel: String
    let secondLabel: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(mainLabel)
                        .font(.custom(.medium, size: 16))
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .fontWeight(.semibold)
                    Text(secondLabel)
                        .font(.custom(.medium, size: 14))
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .opacity(0.5)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.black)
            }
        }
    }
}

struct HHotelParameterView_Previews: PreviewProvider {
    static var previews: some View {
        HHotelParameterView(image: "tick-square",
                            mainLabel: "Удобства",
                            secondLabel: "Самое необходимое")
    }
}
