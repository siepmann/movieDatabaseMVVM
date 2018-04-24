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
    private var currentMovieId: Int = 0
    private var scrollView: UIScrollView!
    
    private var moviePoster: UIImageView!
    private var movieNameLabel: UILabel!
    private var moviePlot: UILabel!
    private var movieReleaseDate: UILabel!
    private var movieGenres: UILabel!
    
    init(movieId: Int) {
        currentMovieId = movieId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setScrollView()
        requestMovieDetails()
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
            make.topMargin.equalTo(self.view)
            make.bottomMargin.equalTo(self.view)
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
            make.trailingMargin.equalTo(wrapper).offset(-12)
            make.height.equalTo(30)
        }
        
        movieReleaseDate.snp.makeConstraints { (make) in
            make.topMargin.equalTo(movieNameLabel.snp.bottomMargin).offset(20)
            make.leadingMargin.equalTo(wrapper).offset(12)
            make.trailingMargin.equalTo(wrapper).offset(-12)
            make.height.equalTo(30)
        }
        
        movieGenres.snp.makeConstraints { (make) in
            make.topMargin.equalTo(movieReleaseDate.snp.bottomMargin).offset(20)
            make.leadingMargin.equalTo(wrapper).offset(12)
            make.trailingMargin.equalTo(wrapper).offset(-12)
            make.height.equalTo(30)
        }
        
        moviePlot.snp.makeConstraints { (make) in
            make.topMargin.equalTo(movieGenres.snp.bottomMargin).offset(20)
            make.leadingMargin.equalTo(wrapper).offset(12)
            make.trailingMargin.equalTo(wrapper).offset(-12)
            make.bottomMargin.equalTo(wrapper)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func requestMovieDetails() {
        
    }
}
