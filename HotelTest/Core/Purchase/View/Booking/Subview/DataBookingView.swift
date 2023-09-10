//
//  DataBookingView.swift
//  HotelTest
//
//  Created by Alexander V. on 05.09.2023.
//

import SwiftUI
import Combine

struct DataBookingView: View {
    
    @ObservedObject var vm: BookingViewModel
    @State private var width: CGFloat?
    private let event = PassthroughSubject<CGFloat, Never>()
    
    var body: some View {
        VStack(spacing: 16) {
            ForEach(vm.dataBooking) { mark in
                HStack(alignment: .top, spacing: 30) {
                    Text(mark.name)
                        .foregroundColor(R.Color.nameTextBooking)
                        .font(.custom(.regular, size: 16))
                        .frame(width: width, alignment: .leading)
                        .lineLimit(1)
                        .background(WidthGetter(widthChanged: event))
                    Text(mark.value)
                        .foregroundColor(R.Color.valueTextBooking)
                        .font(.custom(.regular, size: 16))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .onReceive(event) { w in
            if w > (self.width ?? .zero) {
                self.width = w
            }
        }
    }
}

struct DataBookingView_Previews: PreviewProvider {
    static var previews: some View {
        DataBookingView(vm: .init(apiBooking: "https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8"))
    }
}
