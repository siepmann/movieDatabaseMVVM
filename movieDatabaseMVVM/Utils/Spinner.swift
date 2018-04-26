//
//  Spinner.swift
//  movieDatabaseMVVM
//
//  Created by Guilherme Siepmann on 26/04/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import UIKit

open class Spinner {
    internal static var spinner: UIActivityIndicatorView?
    open static var style: UIActivityIndicatorViewStyle = .whiteLarge
    open static var baseBackColor = UIColor(white: 0, alpha: 0.6)
    
    open static func start(style: UIActivityIndicatorViewStyle = style, backColor: UIColor = baseBackColor) {
        if spinner == nil, let window = UIApplication.shared.keyWindow {
            let frame = UIScreen.main.bounds
            spinner = UIActivityIndicatorView(frame: frame)
            spinner!.backgroundColor = backColor
            spinner!.activityIndicatorViewStyle = style
            window.addSubview(spinner!)
            spinner!.startAnimating()
        }
    }
    
    open static func stop() {
        if spinner != nil {
            spinner!.stopAnimating()
            spinner!.removeFromSuperview()
            spinner = nil
        }
    }
}
