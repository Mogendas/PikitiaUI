//
//  ContentViewModel.swift
//  PikitiaUI
//
//  Created by Johan Wejdenstolpe on 2023-02-14.
//

import SwiftUI

@MainActor final class ContentViewModel: ObservableObject {
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
                                
                self.photos = newPhotos
                
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
