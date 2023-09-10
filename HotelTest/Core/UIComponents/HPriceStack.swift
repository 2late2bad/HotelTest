//
//  HPriceStack.swift
//  HotelTest
//
//  Created by Alexander V. on 07.09.2023.
//

import SwiftUI

struct HPriceStack: View {
    
    let name: String
    let value: Int?
    let isResult: Bool
    
    var body: some View {
        HStack {
            Text(name)
                .foregroundColor(R.Color.nameTextBooking)
                .font(.custom(.regular, size: 16))
            Spacer()
            Text("\(value?.ruNumb ?? "") ₽")
                .foregroundColor(isResult ? R.Color.resultTextBooking : R.Color.valueTextBooking)
                .font(.custom(isResult ? .semibold : .regular, size: 16))
        }
    }
}

struct HPriceStack_Previews: PreviewProvider {
    static var previews: some View {
        HPriceStack(name: "Тест", value: 666999, isResult: true)
    }
}
