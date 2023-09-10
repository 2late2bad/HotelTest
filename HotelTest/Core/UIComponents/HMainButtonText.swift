//
//  HMainButtonText.swift
//  HotelTest
//
//  Created by Alexander V. on 10.09.2023.
//

import SwiftUI

struct HMainButtonText: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(R.Color.buttonFore)
            .frame(height: 48)
            .frame(maxWidth: .infinity)
            .background(R.Color.buttonBack)
            .cornerRadius(15)
            .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0.0, y: 10)
    }
}

struct HMainButtonText_Previews: PreviewProvider {
    static var previews: some View {
        HMainButtonText(text: "Тестовое название")
    }
}
