//
//  HotelComfortView.swift
//  HotelTest
//
//  Created by Alexander V. on 05.09.2023.
//

import SwiftUI

struct HotelComfortView: View {
        
    var body: some View {
        VStack {
            ForEach(Parameter.instance) { item in
                VStack(alignment: .leading) {
                    HHotelParameterView(image: item.image,
                                        mainLabel: item.title,
                                        secondLabel: item.secondTitle)
                }
                .padding(.horizontal, 15)
                if checkLastParam(item: item) {
                    Divider()
                        .padding(.leading, 50)
                        .padding(.trailing, 15)
                }
            }
        }
        .padding(.vertical, 15)
        .background(Color.gray.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    func checkLastParam(item: Parameter) -> Bool {
        item.id != Parameter.instance.last?.id
    }
}

struct HotelComfortView_Previews: PreviewProvider {
    static var previews: some View {
        HotelComfortView()
    }
}
