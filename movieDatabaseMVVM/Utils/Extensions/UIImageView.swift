//
//  UIImageView.swift
//  movieDatabaseMVVM
//
//  Created by Guilherme Siepmann on 24/04/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import Kingfisher

extension UIImageView {
    func setImageWithStringUrl(_ string: String,  placeHolder: String = "") {
        self.kf.setImage(with: URL(string: string),
                         placeholder: Image(named: placeHolder),
                         options: [.transition(.fade(1)), .cacheMemoryOnly],
                         progressBlock: nil,
                         completionHandler: nil)
    }
}


