//
//  MovieDetail.swift
//  movieDatabaseMVVM
//
//  Created by Guilherme Siepmann on 24/04/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//
import Foundation

struct MovieDetail : Codable, Mappable {
    var id: Int = 0
    var title: String!
    var poster: String?
    var overview: String?
    var genres: [Genres]!
    var releaseDateString: String!
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title = "original_title"
        case poster = "poster_path"
        case overview
        case genres
        case releaseDateString = "release_date"
    }
    
    public var posterURL: String {
        guard let posterPath = poster else { return "" }
        return "\(Config.baseImageURL)\(posterPath)"
    }
    
    var releaseDate: Date? {
        guard let dateFormat = releaseDateString, !dateFormat.isEmpty else {
            return nil
        }
        
        return getDate(withString: dateFormat)
    }
    
    public var releasedYear: String {
        guard let dateFormat = releaseDateString, !dateFormat.isEmpty else {
            return ""
        }
        //TODO: Remove force unwrap
        return getYear(withString: dateFormat)!
    }
    
    public var genresString: String {
        return genres.map { $0.name }.joined(separator: ", ")
    }
}

