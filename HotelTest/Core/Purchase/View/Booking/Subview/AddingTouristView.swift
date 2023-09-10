//
//  AddingTouristView.swift
//  HotelTest
//
//  Created by Alexander V. on 05.09.2023.
//

import SwiftUI

struct AddingTouristView: View {
    
    @ObservedObject var vm: BookingViewModel
    
    var body: some View {
        HStack {
            Text("Добавить туриста")
                .font(.custom(.medium, size: 22))
            Spacer()
            Button {
                vm.addTourist()
            } label: {
                Image(systemName: "plus.square.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(R.Color.buttonBack)
            }
        }
    }
}
