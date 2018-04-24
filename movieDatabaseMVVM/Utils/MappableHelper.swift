//
//  MappableHelper.swift
//  movieDatabaseMVVM
//
//  Created by Guilherme Siepmann on 24/04/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import Foundation

class MappableHelper {
    
    // Just to make sure that a new dateFormatter is not being created every time
    // we decode a model.
    static var dateFormatter: DateFormatter = DateFormatter()
    static let decoder = JSONDecoder()
    
    static func getDateFormatter(withFormat format: String) -> DateFormatter {
        dateFormatter.dateFormat = format
        return dateFormatter
    }
    
}
