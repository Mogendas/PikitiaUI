//
//  PhotoViewModel.swift
//  PikitiaUI
//
//  Created by Johan Wejdenstolpe on 2023-02-15.
//

import Foundation

final class PhotoViewModel: ObservableObject {
    @Published var photo: Photo
    
    init(photo: Photo) {
        self.photo = photo
    }
    
    var imageURLString: String {
        return photo.imageURLString
    }
}
