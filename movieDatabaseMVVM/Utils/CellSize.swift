//
//  CellSize.swift
//  movieDatabaseMVVM
//
//  Created by Guilherme Siepmann on 24/04/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import Foundation
import UIKit

public class CellSize {
    public static let shared = CellSize()
    
    private init() {
    }
    
    public var cellWidth: CGFloat {
        switch UIDevice.inches() {
        case .inches_4_7, .inches_X:
            return 157.5
        case .inches_5_5:
            return 177
        default:
            return 130
        }
    }
    
    public var cellHeight: CGFloat {
        return cellWidth * 1.5
    }
}

