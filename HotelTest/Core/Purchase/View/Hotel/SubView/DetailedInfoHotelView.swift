//
//  DetailedInfoHotelView.swift
//  HotelTest
//
//  Created by Alexander V. on 04.09.2023.
//

import SwiftUI

struct DetailedInfoHotelView: View {
    
    @ObservedObject var vm: HotelViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Об отеле")
                .font(.custom(.medium, size: 22))
            
            VStack(alignment: .leading, spacing: 12) {
                HTagsView(items: vm.hotel?.aboutTheHotel.peculiarities)
                
                Text(vm.hotel?.aboutTheHotel.description ?? "Нет информации по отелю")
                    .font(.custom(.regular, size: 16))
                    .lineLimit(nil)
            }
            
            HotelComfortView()
        }
        .padding(.all, 16)
        .frame(maxWidth: .infinity)
        .background(R.Color.hotelBlockBackground)
    }
}

//struct DetailedInfoHotelView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailedInfoHotelView(vm:)
//    }
//}
