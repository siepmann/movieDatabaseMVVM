//
//  MoviesViewModel.swift
//  movieDatabaseMVVM
//
//  Created by Guilherme Siepmann on 24/04/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import Foundation

protocol MoviesViewDelegate: class {
    func responseHasMovies()
}

class MoviesViewModel {
    private let service = Service()
    private var movies = [Movie]()
    private var page = 1
    private var hasNextPage = false
    private var isRequesting = false
    
    var numberOfItems: Int {
        return movies.count
    }
    
    var shouldPaginate: Bool {
        return hasNextPage
    }
    
    private weak var delegate: MoviesViewDelegate?
    
    init(delegate: MoviesViewDelegate?) {
        self.delegate = delegate
    }
    
    fileprivate func getPopularMovies() {
        isRequesting = true
        service.getPopularMovies(page: page) { [weak self] response in
            self?.isRequesting = false
            guard let _response = response else { return }
            self?.handle(_response)
        }
    }
    
    fileprivate func handle(_ response: MoviesEntity) {
        if response.results.isEmpty {
            return
        }
        
        page = response.page
        hasNextPage = response.totalPages > page
        movies.append(contentsOf: response.results)
        delegate?.responseHasMovies()
    }
    
    func paginate() {
        if isRequesting || shouldPaginate { return }
        
        page += 1
        getPopularMovies()
    }
    
    func getMovies() {
        movies = []
        page = 1
        hasNextPage = false
        getPopularMovies()
    }
    
    func getCellModel(for indexPath: IndexPath) -> CollectionViewCellViewModel {
        return CollectionViewCellViewModel(movie: movies[indexPath.row])
    }
}

