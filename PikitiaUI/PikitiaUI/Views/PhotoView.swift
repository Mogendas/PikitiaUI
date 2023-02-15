//
//  PhotoView.swift
//  PikitiaUI
//
//  Created by Johan Wejdenstolpe on 2023-02-14.
//

import SwiftUI

struct PhotoView: View {
    @StateObject var viewModel: PhotoViewModel
    
    var body: some View {
        if let url = URL(string: viewModel.imageURLString) {
            VStack {
                Text(viewModel.photoTitle)
                    .padding(.top, 16)
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                Spacer()
                AsyncImage(
                    url: url,
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                        
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                Spacer()
            }
            .background(.blue)
        }
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var photo = Photo(id: "52689269925",
                             owner: "191250000",
                             secret: "1d361cfb39",
                             server: "65535",
                             farm: 66,
                             title: "Santa Cruz Beach Boardwalk",
                             ispublic: 1,
                             isfriend: 0,
                             isfamily: 0)
    static var viewModel = PhotoViewModel(photo: photo)
    static var previews: some View {
        PhotoView(viewModel: viewModel)
    }
}
