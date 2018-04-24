//
//  CollectionViewCellViewModel.swift
//  movieDatabaseMVVM
//
//  Created by Guilherme Siepmann on 24/04/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionViewCellViewModel {
    private let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var movieID: Int {
        return movie.id ?? 0
    }
    
    var title: String {
        return movie.title ?? ""
    }
    
    func setPosterImage(to imageView: UIImageView) {
        imageView.setImageWithStringUrl(movie.posterURL)
    }
}
