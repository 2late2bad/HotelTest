//
//  HMobileTextField.swift
//  HotelTest
//
//  Created by Alexander V. on 05.09.2023.
//

import SwiftUI
import Combine

struct HMobileTextField: View {
    
    @ObservedObject var vm: BookingViewModel
    @State private var numberMobile: String = "+7 (***) ***-**-**"

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(vm.isShowErrorMobile ? R.Color.textFieldBackError : R.Color.textFieldBackDefault)
            
            PhoneTextField(text: $numberMobile, placeholder: $vm.placholderMobile)
                .padding(.horizontal, 16)
                .offset(x: 0, y: numberMobile.isEmpty ? 0 : 8)
                .onSubmit {
                    if vm.isMobileValid {
                        vm.placholderMobile = "Номер телефона"
                        vm.isShowErrorMobile = false
                    } else {
                        vm.placholderMobile = "Номер телефона введен некорректно"
                        vm.isShowErrorMobile = true
                    }
                }
                .onChange(of: numberMobile, perform: { newValue in
                    if (numberMobile.count < 18) || (numberMobile.contains("*")) {
                        vm.isMobileValid = false
                    } else {
                        vm.isMobileValid = true
                    }
                })
                .onTapGesture {
                    vm.placholderMobile = "Номер телефона"
                    vm.isShowErrorMobile = false
                }
        }
        .frame(height: 52)
    }
}
