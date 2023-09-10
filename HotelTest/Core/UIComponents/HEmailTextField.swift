//
//  HEmailTextField.swift
//  HotelTest
//
//  Created by Alexander V. on 05.09.2023.
//

import SwiftUI

struct HEmailTextField: View {
    
    @ObservedObject var vm: BookingViewModel
    @State var emailAddress: String = ""
        
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(vm.isShowErrorEmail ? R.Color.textFieldBackError : R.Color.textFieldBackDefault)
            
            ZStack {
                TextField(vm.placholderEmail, text: $emailAddress)
                    .font(.custom(.regular, size: 16))
                    .onSubmit {
                        if vm.isEmailValid {
                            vm.placholderEmail = "Почта"
                            vm.isShowErrorEmail = false
                        } else {
                            vm.placholderEmail = "Почта введена некорректно"
                            vm.isShowErrorEmail = true
                        }
                    }
                    .onChange(of: emailAddress, perform: { newValue in
                        if textFieldValidatorEmail(newValue) {
                            vm.isEmailValid = true
                        } else {
                            vm.isEmailValid = false
                        }
                    })
                    .onTapGesture {
                        vm.isShowErrorEmail = false
                        vm.placholderEmail = "Почта"
                    }
                    .modifier(TopFloatingHolder(noText: emailAddress.isEmpty,
                                                placeHolderKey: vm.placholderEmail))
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
            }
            .padding(.horizontal, 16)
            .offset(x: 0, y: emailAddress.isEmpty ? 0 : 8)
        }
        .frame(height: 52)
    }
    
    func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
}
