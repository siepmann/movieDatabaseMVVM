//
//  Mappable.swift
//  movieDatabaseMVVM
//
//  Created by Guilherme Siepmann on 24/04/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import Foundation

/// Helps on decoding models
protocol Mappable {
    var dateFormat: String { get }
    
    // Creates a new instance by decoding from the given data.
    init(from: Data) throws
    
    func getDate(withString dateString: String) -> Date?
    
    func getYear(withString dateString: String) -> String?
}

extension Mappable where Self: Decodable {
    
    var dateFormat: String {
        return "yyyy-MM-dd"
    }
    
    init(from data: Data) throws {
        self = try MappableHelper.decoder.decode(Self.self, from: data)
    }
    
    func getDate(withString dateString: String) -> Date? {
        return MappableHelper.getDateFormatter(withFormat: dateFormat).date(from: dateString)
    }
    
    func getYear(withString dateString: String) -> String? {
        guard let date = getDate(withString: dateString) else { return "" }
        return String(Calendar.current.component(.year, from: date))
    }
    
}

