//
//  Photos.swift
//  Pikitia
//
//  Created by Johan Wejdenstolpe on 2023-02-11.
//

import Foundation

final class Photos: Codable, ObservableObject {
    let page: Int
    let pages: Int
    let perpage: Int
    let total: Int
    let photo: [Photo]
}
