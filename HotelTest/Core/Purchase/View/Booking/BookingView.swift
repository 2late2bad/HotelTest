//
//  BookingView.swift
//  HotelTest
//
//  Created by Alexander V. on 04.09.2023.
//

import SwiftUI

struct BookingView: View {
    
    @ObservedObject var vm: BookingViewModel
    @State var showAlert: Bool = false
    var backRequest: () -> ()
    var doneRequest: () -> Void
    
    var body: some View {
        NavigationView {
            ZStack {
                R.Color.background
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 8) {
                        HMainInfoHotel(name: vm.booking?.hotelName,
                                       address: vm.booking?.hotelAdress,
                                       rating: vm.booking?.horating,
                                       ratingName: vm.booking?.ratingName)
                        .frame(maxWidth: .infinity)
                        .padding(.all, 16)
                        .background(Color.white)
                        .cornerRadius(15)
                        
                        DataBookingView(vm: vm)
                            .frame(maxWidth: .infinity)
                            .padding(.all, 16)
                            .background(Color.white)
                            .cornerRadius(12)
                        
                        BuyerInfoView(vm: vm)
                            .frame(maxWidth: .infinity)
                            .padding(.all, 16)
                            .background(Color.white)
                            .cornerRadius(12)
                        
                        ForEach(vm.listTourist) { tour in
                            tour.info
                                .frame(maxWidth: .infinity)
                                .padding(.all, 16)
                                .background(Color.white)
                                .cornerRadius(12)
                        }
                        
                        AddingTouristView(vm: vm)
                            .frame(maxWidth: .infinity)
                            .padding(.all, 16)
                            .background(Color.white)
                            .cornerRadius(12)
                        
                        TotalPriceView(vm: vm)
                            .frame(maxWidth: .infinity)
                            .padding(.all, 16)
                            .background(Color.white)
                            .cornerRadius(12)
                    }
                    .padding(.top, 8)
                    
                    Button {
                        if vm.canDone {
                            doneRequest()
                        } else {
                            showAlert.toggle()
                            vm.checkTourists()
                        }
                    } label: {
                        HMainButtonText(text: "Оплатить \(vm.totalPrice?.ruNumb ?? "") ₽")
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(Color.white)
                }
            }
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Пожалуйста, заполните корректно все поля"))
            })
            .onTapGesture {
                hideKeyboard()
            }
            .onAppear {
                vm.isShowErrorEmail = false
                vm.isShowErrorMobile = false
                vm.listTourist.forEach { $0.info.vm.showError = false }
            }
            .navigationTitle("Бронирование")
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
