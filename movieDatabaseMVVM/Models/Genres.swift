//
//  Genres.swift
//  movieDatabaseMVVM
//
//  Created by Guilherme Siepmann on 24/04/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import Foundation

public struct Genres : Codable, Mappable {
    var id: Int = 0
    var name: String!
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
