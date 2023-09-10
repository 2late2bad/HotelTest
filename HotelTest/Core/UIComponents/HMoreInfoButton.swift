//
//  HMoreInfoButton.swift
//  HotelTest
//
//  Created by Alexander V. on 05.09.2023.
//

import SwiftUI

struct HMoreInfoButton: View {
    var body: some View {
        Button {} label: {
            HStack(spacing: 6) {
                Text("Подробнее о номере")
                    .font(.custom(.medium, size: 16))
                Image(systemName: "chevron.right")
            }
            .foregroundColor(R.Color.moreInfoButtonForeground)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(R.Color.moreInfoButtonBackground)
            .cornerRadius(5)
        }
    }
}

struct HMoreInfoButton_Previews: PreviewProvider {
    static var previews: some View {
        HMoreInfoButton()
    }
}
