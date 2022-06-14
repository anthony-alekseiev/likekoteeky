//
//  BreedsCoordinatorView.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 14.06.2022.
//

import SwiftUI

typealias BreedDetailsProviderCallback = (_ breedItem: BreedDisplayItem) -> BreedDetailsView
typealias BreedListProviderCallback = () -> BreedsView

struct BreedsCoordinatorView: View {
    @ObservedObject var viewModel: BreedsCoordinatorViewModel
    var breedsListProvider: BreedListProviderCallback!
    
    var body: some View {
        NavigationView {
            if breedsListProvider != nil {
                breedsListProvider!()
            } else {
                EmptyView()
            }
        }
    }
}

struct BreedsCoordinatorView_Previews: PreviewProvider {
    @State static var viewModel = BreedsCoordinatorViewModel()
    @State static var breedsViewModel = BreedsViewModel(
        imageLoader: FakeImageLoader(images: []),
        breedsService: FakeBreedsService(
            response: BreedsListResponse()
        )
    )
    
    static var previews: some View {
        BreedsCoordinatorView(viewModel: viewModel)
    }
}
