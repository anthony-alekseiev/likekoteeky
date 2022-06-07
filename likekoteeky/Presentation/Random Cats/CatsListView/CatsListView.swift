//
//  ContentView.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 04.06.2022.
//
import SwiftUI
import Combine

struct CatsListView: View {
    
    @ObservedObject var viewModel: CatsListViewModel
    
    var body: some View {
        NavigationView {
            CatsCardsStack(items: $viewModel.catItems)
                .padding()
        }
        .navigationTitle("Cats")
        .onAppear{
            viewModel.fetchCats()
        }
    }
}

struct CatsListView_Previews: PreviewProvider {
    @State static var vm = CatsListViewModel(
        imageLoader: FakeImageLoader(images: []),
        catsService: FakeCatsImagesService(response: [])
    )
    static var previews: some View {
        CatsListView(viewModel: vm)
    }
}
