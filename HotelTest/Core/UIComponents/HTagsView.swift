//
//  HTagsView.swift
//  HotelTest
//
//  Created by Alexander V. on 04.09.2023.
//

import SwiftUI
import UIKit

struct HTagsView: View {
    
    let items: [String]
    var groupedItems: [[String]] = [[String]]()
    let screenWidth = UIScreen.main.bounds.width
    
    init(items: [String]?) {
        if let items {
            self.items = items
            groupedItems = createGroupedItems(items)
        } else {
            self.items = []
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(groupedItems, id: \.self) { subItems in
                HStack {
                    ForEach(subItems, id: \.self) { word in
                        Text(word)
                            .fixedSize()
                            .font(.custom(.medium, size: 16))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(R.Color.tagBackground)
                            .foregroundColor(R.Color.tagForeground)
                            .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                    }
                }
            }
        }
    }
    
    private func createGroupedItems(_ items: [String]) -> [[String]] {
        var groupedItems: [[String]] = [[String]]()
        var tempItems: [String] = [String]()
        var width: CGFloat = 0
        
        items.forEach { word in
            let label = UILabel()
            label.text = word
            label.sizeToFit()
            
            let labelWidth = label.frame.size.width + 16
            
            if (width + labelWidth + 16) < screenWidth {
                width += labelWidth
                tempItems.append(word)
            } else {
                width = labelWidth
                groupedItems.append(tempItems)
                tempItems.removeAll()
                tempItems.append(word)
            }
        }
        
        groupedItems.append(tempItems)
        return groupedItems
    }
}

struct HTagsView_Previews: PreviewProvider {
    static var previews: some View {
        HTagsView(items: ["3-я линия",
                          "Платный Wi-Fi в фойе",
                          "30 км до аэропорта",
                          "1 км до пляжа" , "3-я линия",
                          "Платный Wi-Fi",
                          "30 км",
                          "1 км до пляжа", "линия",
                          "Платный Wi-Fi в фойе",
                          "30 км до аэропорта",
                          "1 км до пляжа"])
    }
}
