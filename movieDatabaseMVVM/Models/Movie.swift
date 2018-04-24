//
//  Movie.swift
//  movieDatabaseMVVM
//
//  Created by Guilherme Siepmann on 24/04/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import Foundation

struct Movie : Mappable, Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case title = "original_title"
        case poster = "poster_path"
        case releaseDate = "release_date"
        case overview
    }
    
    var id: Int?
    var title: String?
    var poster: String?
    var overview: String?
    var releaseDate: String!
    
    public var posterURL: String {
        guard let posterPath = poster else { return "" }
        return "\(Config.baseImageURL)\(posterPath)"
    }
    
    public var releasedYear: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: self.releaseDate)
        
        return String(Calendar.current.component(.year, from: date!))
    }
}

