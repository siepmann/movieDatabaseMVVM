//
//  MovieDetailViewModel.swift
//  movieDatabaseMVVM
//
//  Created by Guilherme Siepmann on 24/04/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import Foundation

protocol MovieDetailDelegate: class {
    func movieFetched()
}

class MovieDetailViewModel {
    private weak var delegate: MovieDetailDelegate?
    private let service = Service()
    private var movieId = 0
    private var isRequesting = false
    private var movie: MovieDetail?
    
    init(movieId: Int, delegate: MovieDetailDelegate) {
        self.delegate = delegate
        self.movieId = movieId
    }
    
    func getMovieDetail() {
        isRequesting = true
        
        service.getMovieDetail(movieId: movieId) { [weak self] response in
            self?.isRequesting = false
            guard let _response = response else { return }
            self?.movie = _response
            self?.delegate?.movieFetched()
        }
    }
    
    func getUIViewModel() -> UIViewMovieDetail? {
        guard let detail = movie else { return nil }
        return UIViewMovieDetail(detail)
    }
}
