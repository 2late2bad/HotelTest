//
//  HImageCarouselView.swift
//  HotelTest
//
//  Created by Alexander V. on 04.09.2023.
//

import UIKit
import SwiftUI

struct HImageCarouselView: View {
    
    var images: [String]
    @State private var selectedPage = 0
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                TabView(selection: $selectedPage) {
                    ForEach(images.indices, id: \.self) { i in
                        HImageView(url: images[i])
                            .cornerRadius(15)
                            .tag(i)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                HStack {
                    ForEach(images.indices, id: \.self) { i in
                        Circle()
                            .frame(width: 7, height: 7)
                            .foregroundColor(i == selectedPage ? .black : .black.opacity(getAlphaIndicator(index: i)))
                            .onTapGesture {
                                if i < selectedPage {
                                    withAnimation { selectedPage -= 1 }
                                } else if i > selectedPage {
                                    withAnimation { selectedPage += 1 }
                                }
                            }
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color.white)
                .cornerRadius(5)
                .padding(.bottom, 8)
            }
            .animation(.easeIn(duration: 0.1), value: selectedPage)
        }
        .frame(height: 257)
        .cornerRadius(15)
        .ignoresSafeArea()
    }
    
    func getAlphaIndicator(index: Int) -> Double {
        if selectedPage == index - 1 || selectedPage == index + 1 {
            return 0.22
        } else if selectedPage == index - 2 || selectedPage == index + 2 {
            return 0.17
        } else if selectedPage == index - 3 || selectedPage == index + 3 {
            return 0.10
        } else {
            return 0.05
        }
    }
}
