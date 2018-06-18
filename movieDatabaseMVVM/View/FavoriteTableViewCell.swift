//
//  FavoriteTableViewCell.swift
//  movieDatabaseMVVM
//
//  Created by Guilherme Siepmann on 24/04/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import UIKit
import SnapKit

class FavoriteTableViewCell: UITableViewCell {
    private var posterImage: UIImageView!
    private var movieNameLabel: UILabel!
    private var plotLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        posterImage = UIImageView()
        posterImage.contentMode = .scaleToFill
        posterImage.isUserInteractionEnabled = false
        
        movieNameLabel = UILabel()
        
        plotLabel = UILabel()
        plotLabel.numberOfLines = 3
        
        self.contentView.addSubview(posterImage)
        self.contentView.addSubview(movieNameLabel)
        self.contentView.addSubview(plotLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let width: CGFloat = 130 / 1.5
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        posterImage.snp.makeConstraints { (make) in
            make.width.equalTo(width)
            make.topMargin.equalTo(contentView).offset(10)
            make.bottomMargin.equalTo(contentView).inset(10)
            make.leadingMargin.equalTo(contentView)
        }
        
        movieNameLabel.snp.makeConstraints { (make) in
            make.topMargin.equalTo(contentView).offset(12)
            make.leadingMargin.equalTo(posterImage.snp.trailingMargin).offset(20)
            make.trailingMargin.equalTo(contentView).inset(12)
            make.height.equalTo(30)
        }
        
        plotLabel.snp.makeConstraints { (make) in
            make.leadingMargin.equalTo(posterImage.snp.trailingMargin).offset(20)
            make.topMargin.equalTo(movieNameLabel.snp.bottomMargin).offset(8)
            make.trailingMargin.equalTo(contentView).inset(12)
            make.bottomMargin.equalTo(contentView)
        }
    }
    
    public func configureCell(_ movie: Movie) {
        movieNameLabel.text = movie.title
        posterImage.setImageWithStringUrl(movie.posterURL)
        plotLabel.text = movie.overview
    }
}

