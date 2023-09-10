//
//  OrderView.swift
//  HotelTest
//
//  Created by Alexander V. on 04.09.2023.
//

import SwiftUI

struct OrderView: View {
    
    var backRequest: () -> ()
    var doneRequest: () -> Void
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack(spacing: 32) {
                    Image(R.Image.party)
                        .frame(width: 94, height: 94)
                        .background(R.Color.orderBackground)
                        .clipShape(Circle())
                    
                    VStack(spacing: 20) {
                        Text("Ваш заказ принят в работу")
                            .font(.custom(.medium, size: 22))
                        
                        Text("Подтверждение заказа №\(Int.randomOrder) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                            .lineLimit(nil)
                            .multilineTextAlignment(.center)
                            .font(.custom(.regular, size: 16))
                            .foregroundColor(R.Color.orderInfoText)
                            .padding(.horizontal, 7)
                    }
                    .padding(.horizontal, 16)
                }
                .position(x: geo.size.width / 2,  y: geo.size.height / 2.5)
                .navigationTitle("Заказ оплачен")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            backRequest()
                        } label: {
                            Image(systemName: "chevron.left")
                                .tint(.black)
                        }
                    }
                }
            }
        }
        .safeAreaInset(edge: .bottom, content: {
            Button {
                doneRequest()
            } label: {
                HMainButtonText(text: "Супер!")
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color.white)
        })
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(backRequest: {}, doneRequest: {})
    }
}
