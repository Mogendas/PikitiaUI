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
        }
    }
}

//struct PhotoView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoView()
//    }
//}
