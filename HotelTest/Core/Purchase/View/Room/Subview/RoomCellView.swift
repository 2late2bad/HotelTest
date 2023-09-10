//
//  RoomCellView.swift
//  HotelTest
//
//  Created by Alexander V. on 05.09.2023.
//

import SwiftUI

struct RoomCellView: View {
    
    var room: Room
    var doneRequest: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                HImageCarouselView(images: room.imageUrls)
                    .frame(height: 257)
                    .cornerRadius(15)
                
                Text(room.name)
                    .font(.custom(.medium, size: 22))
                
                HTagsView(items: room.peculiarities)
                
                HMoreInfoButton()
            }
            
            HPriceHotelView(price: room.price, priceFor: room.pricePer)
            
            Button {
                doneRequest()
            } label: {
                HMainButtonText(text: "Выбрать номер")
            }
        }
        .padding(.all, 16)
        .frame(maxWidth: .infinity)
        .background(R.Color.roomBackground)
    }
}

struct RoomCellView_Previews: PreviewProvider {
    static var previews: some View {
        RoomCellView(room: .init(id: 0, name: "Бич номер", price: 666999, pricePer: "За просто так", peculiarities: ["Ничего не включено", "Ладно, wi-fi", "И печеньки"], imageUrls: []), doneRequest: {})
    }
}
