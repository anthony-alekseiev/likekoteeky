//
//  BreedDetailsView.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 14.06.2022.
//

import SwiftUI

struct BreedDetailsView: View {
    @ObservedObject var viewModel: BreedDetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center,spacing: 10) {
                if viewModel.breedItem.image != nil {
                    Image(uiImage: viewModel.breedItem.image!)
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
                Text(viewModel.breedItem.name)
                    .font(.title)
                Text(viewModel.breedItem.description)
                     Spacer()
            }.padding(.horizontal)
        }
    }
}

struct BreedDetailsView_Previews: PreviewProvider {
    @State static var viewModel = BreedDetailsViewModel(
        breedItem: BreedDisplayItem(
            id: "1",
            name: "American Shorthair",
            description: "The American Shorthair is known for its longevity, robust health, good looks, sweet personality, and amiability with children, dogs, and other pets."
        )
    )
    
    static var previews: some View {
        BreedDetailsView(viewModel: viewModel)
    }
}
