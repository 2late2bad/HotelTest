//
//  HotelView.swift
//  HotelTest
//
//  Created by Alexander V. on 04.09.2023.
//

import SwiftUI
import UIKit

struct HotelView: View {
    
    @ObservedObject var vm: HotelViewModel
    var doneRequest: (String) -> Void
    
    var body: some View {
        NavigationView {
            ScrollViewReader { proxy in
                ZStack {
                    R.Color.background
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 8) {
                            BaseInfoHotelView(vm: vm)
                                .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
                                .id(0)
                            
                            DetailedInfoHotelView(vm: vm)
                                .cornerRadius(12)
                        }
                        .padding(.bottom, 4)
                    }
                    .onAppear {
                        withAnimation(.spring()) {
                            proxy.scrollTo(0, anchor: .top)
                        }
                    }
                    .safeAreaInset(edge: .bottom, content: {
                        Button {
                            doneRequest(vm.hotel?.name ?? "unknown hotel")
                        } label: {
                            HMainButtonText(text: "К выбору номера")
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .background(Color.white)
                    })
                }
                .navigationTitle("Отель")
                .navigationBarTitleDisplayMode(.inline)
                .refreshable {
                    vm.reloadData()
                }
            }
        }
    }
}

struct HotelView_Previews: PreviewProvider {
    static var previews: some View {
        HotelView(vm:
                .init(apiHotel: "https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3",
                      apiRooms: "https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd"),
                  doneRequest: {_ in })
    }
}
