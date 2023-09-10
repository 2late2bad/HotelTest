//
//  HMainTextField.swift
//  HotelTest
//
//  Created by Alexander V. on 05.09.2023.
//

import SwiftUI

struct HMainTextField: View {
        
    @Binding var input: String
    @Binding var showError: Bool
    var placeholder: String
    var correctInput: Bool { !input.isEmpty }
    var isValid: Bool = true
        
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(!correctInput && showError ? R.Color.textFieldBackError : R.Color.textFieldBackDefault)
            
            TextField(placeholder, text: $input)
                .ignoresSafeArea(.keyboard, edges: .bottom)
                .font(.custom(.regular, size: 16))
                .modifier(TopFloatingHolder(noText: input.isEmpty,
                                            placeHolderKey: placeholder))
                .padding(.horizontal, 16)
                .offset(x: 0, y: input.isEmpty ? 0 : 8)
                .onTapGesture {
                    showError = false
                }
        }
        .frame(height: 52)
    }
}
