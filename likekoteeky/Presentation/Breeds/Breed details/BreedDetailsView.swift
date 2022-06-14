//
//  BreedDetailsView.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 14.06.2022.
//

import SwiftUI

struct BreedDetailsView: View {
    var breed: BreedListDisplayItem
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center,spacing: 10) {
                if breed.image != nil {
                    Image(uiImage: breed.image!)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .cornerRadius(10)
                        .padding(3)
                        .clipped()
                } else {
                    Image("cat_placeholder")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .cornerRadius(10)
                        .padding(3)
                        .clipped()
                }
                Text(breed.name)
                    .font(.title)
                Text(breed.description)
                    .font(.body)
                Spacer()
            }.padding(.horizontal)
        }
    }
}

struct BreedDetailsView_Previews: PreviewProvider {
    @State static var breed = BreedListDisplayItem(
        id: "1",
        name: "American Shorthair",
        description: "The American Shorthair is known for its longevity, robust health, good looks, sweet personality, and amiability with children, dogs, and other pets."
    )
    
    static var previews: some View {
        BreedDetailsView(breed: breed)
    }
}
