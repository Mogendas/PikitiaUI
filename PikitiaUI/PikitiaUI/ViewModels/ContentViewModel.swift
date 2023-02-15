//
//  ContentViewModel.swift
//  PikitiaUI
//
//  Created by Johan Wejdenstolpe on 2023-02-14.
//

import SwiftUI

final class ContentViewModel: ObservableObject {
    @Published var photos: Photos?
    @Published var searchString = ""
    
    var columns = [GridItem(.flexible()),
                   GridItem(.flexible())]
        
    init() {
        searchPhotos()
    }
    
    func searchPhotos() {
        guard !searchString.isEmpty else { return }
        let api = FlickrAPI()
        
        let formattedSearchString = searchString.replacingOccurrences(of: " ", with: ",")
        
        Task {
            do {
                let newPhotos = try await api.searchFor(searchString: formattedSearchString).photos
                
                DispatchQueue.main.async {
                    self.photos = newPhotos
                }
                
//                print("NewPhotos: \(newPhotos.photo)")
                
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
