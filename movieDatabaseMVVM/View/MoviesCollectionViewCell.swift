//
//  MoviesCollectionViewCell.swift
//  movieDatabaseMVVM
//
//  Created by Guilherme Siepmann on 24/04/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import UIKit
import SnapKit

public class MoviesCollectionViewCell: UICollectionViewCell {
    private var posterImage: UIImageView!
    private var footerView: UIView!
    private var movieNameLabel: UILabel!
    private var favoriteButton: UIButton!
    private var currentMovie: Movie!
    
    private var cellWidth = CellSize.shared.cellWidth
    private var cellHeight = CellSize.shared.cellHeight
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        posterImage = UIImageView()
        posterImage.contentMode = .scaleToFill
        posterImage.isUserInteractionEnabled = false
        
        footerView = UIView()
        footerView.backgroundColor = .white
        
        movieNameLabel = UILabel()
        movieNameLabel.font = UIFont.systemFont(ofSize: 12)
        movieNameLabel.numberOfLines = 1
        movieNameLabel.contentMode = .center
        movieNameLabel.allowsDefaultTighteningForTruncation = true
        
        favoriteButton = UIButton(type: .custom)
        favoriteButton.setTitle("", for: .normal)
        favoriteButton.setImage(#imageLiteral(resourceName: "favoriteOff"), for: .normal)
        favoriteButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        footerView.addSubview(movieNameLabel)
        footerView.addSubview(favoriteButton)
        
        contentView.addSubview(posterImage)
        contentView.addSubview(footerView)
    }
    
    @objc func buttonPressed() {
        if favoriteButton.currentImage == #imageLiteral(resourceName: "favoriteOff") {
            favoriteButton.setImage(#imageLiteral(resourceName: "favoriteOn"), for: .normal)
        } else {
            favoriteButton.setImage(#imageLiteral(resourceName: "favoriteOff"), for: .normal)
        }
        
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        posterImage.snp.makeConstraints { (make) in
            make.width.equalTo(cellWidth)
            make.height.equalTo(cellHeight - 40)
            make.topMargin.equalTo(contentView)
            make.leadingMargin.equalTo(contentView)
            make.trailingMargin.equalTo(contentView)
        }
        
        footerView.snp.makeConstraints { (make) in
            make.width.equalTo(cellWidth)
            make.height.equalTo(40)
            
            make.bottomMargin.equalTo(contentView)
            make.leadingMargin.equalTo(contentView)
            make.trailingMargin.equalTo(contentView)
        }
        
        movieNameLabel.snp.makeConstraints { (make) in
            make.width.equalTo(cellWidth - 44)
            make.height.equalTo(40)
            make.centerY.equalTo(footerView)
            make.leadingMargin.equalTo(footerView).offset(8)
        }
        
        favoriteButton.snp.makeConstraints { (make) in
            make.width.equalTo(20)
            make.height.equalTo(20)
            make.centerY.equalTo(footerView)
            make.trailingMargin.equalTo(footerView).offset(-8)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(withViewModel viewModel: CollectionViewCellViewModel) {
        movieNameLabel.text = viewModel.title
        viewModel.setPosterImage(to: posterImage)
    }
}

