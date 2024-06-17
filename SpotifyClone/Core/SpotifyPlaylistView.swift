//
//  SpotifyPlaylistView.swift
//  SpotifyClone
//
//  Created by Yuxuan Wu on 5/25/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyPlaylistView: View {
    
    var product: Product = .mock
    var user: User = .mock
    
    @Environment(\.router) var router
    @State private var products: [Product] = []
    @State private var showHeader: Bool = true;
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    PlaylistHeaderCell(
                        height: 250,
                        title: product.title,
                        subtitle: product.brand ?? "Subtitle",
                        imageName: product.thumbnail
                    )
                    .readingFrame { frame in
                        showHeader = frame.maxY < 150
                    }
                    
                    PlaylistDecriptionCell(
                        descriptionText: product.description,
                        username: user.firstName,
                        subheadline: product.category ?? "",
                        onAddToPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onSharePressed: nil,
                        onShufflePressed: nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal, 16)
                    
                    ForEach(products) { product in
                        
                        SongRowCell(
                            imageSize: 50,
                            imageName: product.firstImage,
                            title: product.title,
                            subtitle: product.brand,
                            onCellPrcessed: {
                                goToPlaylistView(product: product)
                            },
                            onEllipsisPrcessed: {
                                
                            }
                        )
                            .padding(.leading, 16)
                    }
                }
            }
            .scrollIndicators(.hidden)
            
            
            header
                .frame(maxHeight: .infinity, alignment: .top)
            
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do {
            
            products = try await DatabaseHelper().getProducts()
            
        } catch {
            print(error)
        }
    }
    
    private func goToPlaylistView(product: Product) {
        
        router.showScreen(.push) { _ in
            SpotifyPlaylistView(product: product, user: user)
        }
    }
    
    private var header: some View {
        ZStack {
            Text(product.title)
                .font(.headline)
                .foregroundStyle(.spotifyWhite)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(Color.spotifyBlack)
                .offset(y: showHeader ? 0 : -40)
                .opacity(showHeader ? 1 : 0)
            
            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(10)
                .background(showHeader ? Color.black.opacity(0.001) : Color.spotifyGray.opacity(0.7))
                .clipShape(Circle())
                .onTapGesture {
                    router.dismissScreen()
                }
                .padding(.leading, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundStyle(.spotifyWhite)
        .animation(.smooth(duration: 0.2), value: showHeader)
        
    }
}

#Preview {
    RouterView { _ in
        SpotifyPlaylistView()
    }
}
