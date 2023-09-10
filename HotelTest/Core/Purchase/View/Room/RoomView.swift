//
//  RoomView.swift
//  HotelTest
//
//  Created by Alexander V. on 04.09.2023.
//

import SwiftUI

struct RoomView: View {
    
    @ObservedObject var vm: HotelViewModel
    let titleHotel: String
    var backRequest: () -> ()
    var doneRequest: () -> Void
    
    var body: some View {
        NavigationView {
            ScrollViewReader { proxy in
                ZStack {
                    R.Color.background

                    ScrollView(showsIndicators: false) {
                        ForEach(vm.rooms) { r in
                            RoomCellView(room: r, doneRequest: doneRequest)
                                .cornerRadius(12)
                                .id(0)
                        }
                        .padding(.vertical, 8)
                    }
                    .onAppear {
                        withAnimation(.spring()) {
                            proxy.scrollTo(0, anchor: UnitPoint(x: 0, y: 1))
                        }
                    }
                }
                .navigationTitle(titleHotel)
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
    }
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView(vm:
                .init(apiHotel: "https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3",
                     apiRooms: "https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd"),
                 titleHotel: "Makardi",
                 backRequest: {},
                 doneRequest: {})
    }
}
