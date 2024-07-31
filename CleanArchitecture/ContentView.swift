//
//  ContentView.swift
//  CleanArchitecture
//
//  Created by mind on 05/03/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewProduct:ProductViewModel
    
    init(viewProduct: ProductViewModel) {
        self._viewProduct = StateObject(wrappedValue: viewProduct)
        }
    
    var body: some View {
        NavigationStack {
            VStack {
                List
                {
                    ForEach(viewProduct.arrProduct ?? [],id: \.id) { product in
                        NavigationLink {
                            NewsView(newsModel: NewsViewModel())
                        } label: {
                            AsyncImage(url: URL(string: product.image)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: .infinity, height: 200)                         case .failure:
                                    Image(systemName: "photo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        }

                    }.lineSpacing(20.0)
                }.listStyle(.plain)
            }
            .onAppear() {
                viewProduct.fetchProducts()
                print(viewProduct
                    .arrProduct?.count ?? 0)
        }
        }
    }
}

#Preview {
    ContentView(viewProduct: ProductViewModel())
}
