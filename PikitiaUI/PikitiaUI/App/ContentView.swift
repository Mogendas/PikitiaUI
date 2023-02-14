//
//  ContentView.swift
//  PikitiaUI
//
//  Created by Johan Wejdenstolpe on 2023-02-14.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                Spacer()
                TextField("Search text", text: $viewModel.searchString, onCommit: {
                        viewModel.searchPhotos()
                })
                .padding(10)
                .background(.white)
                .cornerRadius(20)
                .shadow(color: .gray, radius: 10)
                
                
                ScrollView {
                    LazyVGrid(columns: viewModel.columns, spacing: 4) {
                        ForEach(viewModel.photos?.photo ?? []) { photo in
                            if let url = URL(string: photo.imageURLString) {
                                AsyncImage(
                                    url: url,
                                    content: { image in
                                        image.resizable()
                                            .frame(width: geometry.size.width / 2 - 8, height: 200)
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                            .cornerRadius(20)
                                        
                                    },
                                    placeholder: {
                                        ProgressView()
                                    }
                                )
                            }
                        }
                    }
                }
                .padding(.top, 4)
            }
            .padding(.leading, 4)
            .padding(.trailing, 4)
            .padding(.bottom, 0)
            .background(Color.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
