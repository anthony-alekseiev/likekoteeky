//
//  CardsStack.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 04.06.2022.
//

import SwiftUI

struct CatsCardsStack: View {
    
    @Binding var items: [CatListDisplayItem]

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach($items.reversed()) { item in
                    CatsListRow(
                        item: item,
                        onRemove: { catItem in
                            items.removeAll(where: { $0.id == catItem.id })
                        }
                    )
                    .animation(.interactiveSpring(), value: items)
                    .frame(
                        width: self.getCardWidth(
                            geometry,
                            idx: items.firstIndex(
                                where: { $0.id == item.id}
                            )!
                        ),
                        height: 400
                    )
                    .offset(
                        x: 0,
                        y: self.getCardOffset(
                            geometry,
                            idx: items.firstIndex(
                                where: { $0.id == item.id}
                            )!
                        )
                    )
                }
            }
            
        }
    }
    
    private func getCardWidth(_ geometry: GeometryProxy, idx: Int) -> CGFloat {
            let offset: CGFloat = CGFloat(idx) * 10
            return geometry.size.width - offset
        }
    
    private func getCardOffset(_ geometry: GeometryProxy, idx: Int) -> CGFloat {
            return  CGFloat(idx) * 10
    }
}

struct CardsStack_Previews: PreviewProvider {
    @State static var cats: [CatListDisplayItem] = [
        CatListDisplayItem(
            id: "One",
            image: UIImage(named: "cat_placeholder")
        ),
        CatListDisplayItem(
            id: "Two",
            image: UIImage(systemName: "cat_placeholder")
        ),
        CatListDisplayItem(
            id: "Three",
            image: UIImage(systemName: "cat_placeholder")
        ),
        CatListDisplayItem(
            id: "Four",
            image: UIImage(systemName: "cat_placeholder")
        )
    ]
    
    static var previews: some View {
        CatsCardsStack(items: $cats).frame(height: 400).padding()
    }
}
