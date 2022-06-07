//
//  CatListRow.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 04.06.2022.
//

import SwiftUI

struct CatsListRow: View {
    
    private var thresholdPercentage: CGFloat = 0.5
    @State private var translation: CGSize = .zero
    @Binding var item: CatListDisplayItem
    private var onRemove: (_ item: CatListDisplayItem) -> Void
    
    init(
        item: Binding<CatListDisplayItem>,
        onRemove: @escaping (_ item: CatListDisplayItem) -> Void
    ) {
        self._item = item
        self.onRemove = onRemove
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                if item.image != nil {
                    Image(uiImage: item.image!)
                        .resizable()
                        .scaledToFill()
                        .frame(
                            width: geometry.size.width,
                            height: geometry.size.height
                        )
                        .clipped()
                } else {
                    Image("cat_placeholder")
                        .resizable()
                        .scaledToFill()
                        .frame(
                            width: geometry.size.width,
                            height: geometry.size.height
                        )
                        .clipped()
                }
                VStack {
                    Spacer()
                    HStack(spacing: 8) {
                        Button {
                            
                        } label: {
                            Image("heart")
                        }
                        .padding()
                        Button {
                            
                        } label: {
                            Image("star")
                        }
                        .padding()
                        Spacer()
                        Spacer()
                    }
                    .frame(
                        width: geometry.size.width
                    )
                    .background(
                        Color.gray.blur(radius: 40).clipped()
                    )
                    
                }
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .animation(.interactiveSpring(), value: translation)
            .offset(
                x: self.translation.width,
                y: 0
            )
            .rotationEffect(
                .degrees(
                    Double(
                        self.translation.width / geometry.size.width
                    ) * 25
                ),
                anchor: .bottom
            )
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.translation = value.translation
                    }.onEnded { value in
                        if abs(self.getGesturePercentage(geometry, from: value)) > self.thresholdPercentage {
                            self.onRemove(self.item)
                        } else {
                            self.translation = .zero
                        }
                    }
            )
        }
    }
    
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
            gesture.translation.width / geometry.size.width
    }
}

struct CatsListRow_Previews: PreviewProvider {
    @State static var cat: CatListDisplayItem = CatListDisplayItem(
        id: "One",
        image: UIImage(named: "cat_placeholder")
    )
    
    static var previews: some View {
        CatsListRow(item: $cat, onRemove: { _ in  }).frame(height: 400).padding()
    }
}
