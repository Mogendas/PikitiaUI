//
//  ContentView.swift
//  PikitiaUI
//
//  Created by Johan Wejdenstolpe on 2023-02-14.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @State var isShowingPageView = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    TextField("Enter search text", text: $viewModel.searchString, onCommit: {
                        viewModel.searchPhotos()
                    })
                    .padding(10)
                    .background(.white)
                    .cornerRadius(20)
                    .shadow(color: .gray, radius: 10)
                    .submitLabel(.search)
                    
                        if let photos = viewModel.photos {
                            if photos.photo.isEmpty {
                                Text("Your seach did not result in any images")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                Spacer()
                            } else {
                                ScrollView {
                                    LazyVGrid(columns: viewModel.columns, spacing: 4) {
                                        ForEach(viewModel.photos?.photo ?? []) { photo in
                                            if let url = URL(string: photo.imageURLString),
                                               let viewModel = PhotoViewModel(photo: photo) {
                                                
                                                NavigationLink(destination: PhotoView(viewModel: viewModel)) {
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
                                }
                                .padding(.top, 4)
                            }
                        } else {
                            Text("Try searching for something")
                                .fontWeight(.semibold)
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                            Spacer()
                        }
                }
                .padding(.leading, 8)
                .padding(.trailing, 8)
                .padding(.bottom, 0)
                .background(Color.blue)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
