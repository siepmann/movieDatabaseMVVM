//
//  UIViewMovieDetail.swift
//  movieDatabaseMVVM
//
//  Created by Guilherme Siepmann on 24/04/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import Foundation
import Kingfisher

class UIViewMovieDetail {
    private let detail: MovieDetail
    
    init(_ movieDetail: MovieDetail) {
        detail = movieDetail
    }
    
    var title: String {
        return detail.title
    }
    
    var overview: String {
        return detail.overview ?? ""
    }
    
    var genres: String {
        return detail.genresString
    }
    
    var releaseYear: String {
        return detail.releasedYear
    }
    
    func setPosterImage(to imageView: UIImageView) {
        imageView.setImageWithStringUrl(detail.posterURL)
    }
}
