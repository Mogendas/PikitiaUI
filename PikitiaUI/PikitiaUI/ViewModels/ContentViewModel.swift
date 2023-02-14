//
//  ContentViewModel.swift
//  PikitiaUI
//
//  Created by Johan Wejdenstolpe on 2023-02-14.
//

import SwiftUI

final class ContentViewModel: ObservableObject {
    @Published var photos: Photos?
    @Published var searchString = "KnowIT"
    
    var columns = [GridItem(.flexible()),
                   GridItem(.flexible())]
        
    init() {
        searchPhotos()
    }
    
    func searchPhotos() {
        let api = FlickrAPI()
        
        let formattedSearchString = searchString.replacingOccurrences(of: " ", with: ",")
        
        Task {
            do {
                let newPhotos = try await api.searchFor(searchString: formattedSearchString).photos
                
                DispatchQueue.main.async {
                    self.photos = newPhotos
                }
                
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
