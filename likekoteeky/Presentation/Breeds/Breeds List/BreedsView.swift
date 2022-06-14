//
//  BreedsView.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 07.06.2022.
//

import SwiftUI

struct BreedsView: View {
    @ObservedObject var viewModel: BreedsViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.breedItems) { breed in
                HStack {
                    if breed.image != nil {
                        Image(uiImage: breed.image!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                            .padding(3)
                            .clipped()
                    } else {
                        Image("cat_placeholder")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                            .padding(3)
                            .clipped()
                    }
                    VStack(alignment: .leading, spacing: 8) {
                        Text(breed.name)
                            .font(.headline)
                        Text(breed.description)
                            .font(.body)
                            .minimumScaleFactor(0.8)
                    }
                }
                .frame(height: 100)
                .listRowSeparator(.hidden)
            }
            .navigationTitle("Breeds")
            .onAppear {
                viewModel.fetchBreeds()
            }
        }
        
    }
}

struct BreedsView_Previews: PreviewProvider {
    @State static var viewModel = BreedsViewModel(
        imageLoader: FakeImageLoader(images: []),
        breedsService: FakeBreedsService(response: [])
    )
    
    static var previews: some View {
        BreedsView(viewModel: viewModel)
    }
}
