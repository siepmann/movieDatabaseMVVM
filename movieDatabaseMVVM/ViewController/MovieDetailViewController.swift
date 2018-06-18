//
//  MovieDetailViewController.swift
//  movieDatabaseMVVM
//
//  Created by Guilherme Siepmann on 24/04/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import UIKit
import SnapKit

class MovieDetailViewController: UIViewController {
    private lazy var viewModel: MovieDetailViewModel = MovieDetailViewModel(movieId: currentMovieId, delegate: self)
    
    private var currentMovieId: Int = 0
    private var scrollView: UIScrollView!
    
    private var moviePoster: UIImageView!
    private var movieNameLabel: UILabel!
    private var moviePlot: UILabel!
    private var movieReleaseDate: UILabel!
    private var movieGenres: UILabel!
    private var movieNameTitle: String = ""
    
    init(movieId: Int, movieName: String) {
        currentMovieId = movieId
        movieNameTitle = movieName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.topItem?.title = " "
        self.title = movieNameTitle
        
        setScrollView()
        viewModel.getMovieDetail()
    }
    
    func setScrollView() {
        self.edgesForExtendedLayout = []
        let scrollView = UIScrollView()
        let wrapper = UIView()
        
        moviePoster = UIImageView()
        movieNameLabel = UILabel()
        moviePlot = UILabel()
        movieReleaseDate = UILabel()
        movieGenres = UILabel()
        
        movieReleaseDate.numberOfLines = 0
        moviePlot.numberOfLines = 0
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(wrapper)
        
        wrapper.addSubview(moviePoster)
        wrapper.addSubview(movieNameLabel)
        wrapper.addSubview(moviePlot)
        wrapper.addSubview(movieReleaseDate)
        wrapper.addSubview(movieGenres)
        
        scrollView.snp.makeConstraints { make in
            make.topMargin.bottomMargin.equalTo(self.view)
            make.width.equalToSuperview()
        }
        
        wrapper.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            // only vertical scroll
            make.width.equalToSuperview()
            // only horizontal scroll
            //make.height.equalToSuperview()
        }
        
        moviePoster.snp.makeConstraints { (make) in
            make.topMargin.equalTo(20)
            make.centerX.equalTo(wrapper.snp.centerX)
            make.width.equalTo(UIDevice.currentDeviceWidth / 2)
            make.height.equalTo((UIDevice.currentDeviceWidth / 2) * 1.5)
        }
        
        movieNameLabel.snp.makeConstraints { (make) in
            make.topMargin.equalTo(moviePoster.snp.bottomMargin).offset(20)
            make.leadingMargin.equalTo(wrapper).offset(12)
            make.trailingMargin.equalTo(wrapper).inset(12)
            make.height.equalTo(30)
        }
        
        movieReleaseDate.snp.makeConstraints { (make) in
            make.topMargin.equalTo(movieNameLabel.snp.bottomMargin).offset(20)
            make.leadingMargin.equalTo(wrapper).offset(12)
            make.trailingMargin.equalTo(wrapper).inset(12)
            make.height.equalTo(30)
        }
        
        movieGenres.snp.makeConstraints { (make) in
            make.topMargin.equalTo(movieReleaseDate.snp.bottomMargin).offset(20)
            make.leadingMargin.equalTo(wrapper).offset(12)
            make.trailingMargin.equalTo(wrapper).inset(inset12)
            make.height.equalTo(30)
        }
        
        moviePlot.snp.makeConstraints { (make) in
            make.topMargin.equalTo(movieGenres.snp.bottomMargin).offset(20)
            make.leadingMargin.equalTo(wrapper).offset(12)
            make.trailingMargin.equalTo(wrapper).inset(12)
            make.bottomMargin.equalTo(wrapper).inset(12)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension MovieDetailViewController: MovieDetailDelegate {
    func startLoading() {
        DispatchQueue.main.async {
            Spinner.start()
        }
    }
    
    func stopLoading() {
        DispatchQueue.main.async {
            Spinner.stop()
        }
    }
    
    func movieFetched() {
        DispatchQueue.main.async { [weak self] in
            guard let model = self?.viewModel.getUIViewModel() else { return}
            model.setPosterImage(to: (self?.moviePoster)!)
            
            self?.movieNameLabel.text = model.title
            self?.moviePlot.text = model.overview
            self?.movieReleaseDate.text = model.releaseYear
            self?.movieGenres.text = model.genres
        }
    }
    
    
    
}

