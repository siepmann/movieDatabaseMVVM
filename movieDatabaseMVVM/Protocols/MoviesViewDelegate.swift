//
//  MoviesViewDelegate.swift
//  movieDatabaseMVVM
//
//  Created by Guilherme Siepmann on 26/04/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import Foundation

protocol MoviesViewDelegate: class, Loadable {
    func responseHasMovies()
}
