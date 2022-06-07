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
        List(viewModel.breeds) { breed in
            HStack {
                if breed.image != nil {
                    Image(uiImage: breed.image!)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .padding(3)
                        .clipped()
                } else {
                    Image("cat_placeholder")
                        .resizable()
                        .scaledToFit()
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
            }.frame(height: 100)
        }
    }
}

struct BreedsView_Previews: PreviewProvider {
    @State static var viewModel = BreedsViewModel()
    
    static var previews: some View {
        BreedsView(viewModel: viewModel)
    }
}
