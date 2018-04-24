//
//  MoviesEntity.swift
//  movieDatabaseMVVM
//
//  Created by Guilherme Siepmann on 24/04/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import Foundation

struct MoviesEntity: Codable, Mappable {
    
    private enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
    
    public var page: Int
    public var results: [Movie]
    public var totalResults: Int
    public var totalPages: Int
}
