//
//  TouristsInfoView.swift
//  HotelTest
//
//  Created by Alexander V. on 05.09.2023.
//

import SwiftUI

struct TouristsInfoView: View {
    
    let labelTourist: String
    @ObservedObject var vm: TouristInfoViewModel

    var body: some View {
        VStack(spacing: 20) {
            
            HStack {
                Text(labelTourist)
                    .font(.custom(.medium, size: 22))
                Spacer()
                Button {
                    withAnimation(.easeOut) {
                        vm.show.toggle()
                    }
                } label: {
                    Image(systemName: vm.show ? "chevron.up" : "chevron.down")
                        .frame(width: 32, height: 32)
                        .foregroundColor(R.Color.showButtonForeground)
                        .background(R.Color.showButtonBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.easeOut) {
                    vm.show.toggle()
                }
            }
            
            if vm.show {
                VStack {
                    HMainTextField(input: $vm.name, showError: $vm.showError, placeholder: "Имя")
                    HMainTextField(input: $vm.surname, showError: $vm.showError, placeholder: "Фамилия")
                    HMainTextField(input: $vm.birthday, showError: $vm.showError, placeholder: "Дата рождения")
                    HMainTextField(input: $vm.country, showError: $vm.showError, placeholder: "Гражданство")
                    HMainTextField(input: $vm.passport, showError: $vm.showError, placeholder: "Номер загранпаспорта")
                    HMainTextField(input: $vm.periodPassport, showError: $vm.showError, placeholder: "Срок действия загранпаспорта")
                }
            }
        }
    }
}

struct TouristsInfoView_Previews: PreviewProvider {
    static var previews: some View {
        TouristsInfoView(labelTourist: "Тестовый турист", vm: .init(show: true))
    }
}
