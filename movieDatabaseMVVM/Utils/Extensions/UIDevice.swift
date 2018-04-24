//
//  UIDevice.swift
//  movieDatabaseMVVM
//
//  Created by Guilherme Siepmann on 24/04/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}

// MARK: - Device Structure
public extension UIDevice {
    
    // MARK: - UIDevice
    public static var screenSize: CGSize {
        return UIScreen.main.bounds.size
    }
    
    public static var OSVersion: Float {
        return current.systemVersion.floatValue
    }
    
    public static var height: CGFloat {
        return screenSize.height
    }
    
    public static var currentDeviceWidth: CGFloat {
        return screenSize.width
    }
    
    public static func isPortraitOrientation() -> Bool {
        let orientation: UIInterfaceOrientation = UIApplication.shared.statusBarOrientation
        return UIInterfaceOrientationIsPortrait(orientation)
    }
    
    public static func isLandscapeOrientation() -> Bool {
        return !self.isPortraitOrientation()
    }
    
    // MARK: - Device Idiom Checks
    public  static func isPhone() -> Bool {
        return current.userInterfaceIdiom == .phone
    }
    
    public static func isPad() -> Bool {
        return current.userInterfaceIdiom == .pad
    }
    
    // MARK: - Device Size Checks
    public enum ScreenInches: CGFloat {
        case inches_3_5 = 480
        case inches_4 = 568
        case inches_4_7 = 667
        case inches_5_5 = 736
        case inches_X = 812
        case inches_unknown = 0
    }
    
    public static func inches() -> ScreenInches {
        switch height {
        case 480:
            return ScreenInches.inches_3_5
        case 568:
            return ScreenInches.inches_4
        case 667:
            return ScreenInches.inches_4_7
        case 736:
            return ScreenInches.inches_5_5
        case 812:
            return ScreenInches.inches_X
        default:
            return ScreenInches.inches_unknown
        }
    }
    
    public  static func isEqualToInches(inches: ScreenInches) -> Bool {
        return self.inches() == inches
    }
    
    public  static func isEqualOrGreaterThan(inches: ScreenInches) -> Bool {
        return self.inches().rawValue >= inches.rawValue
    }
    
    public  static func isEqualOrLessThan(inches: ScreenInches) -> Bool {
        return self.inches().rawValue <= inches.rawValue
    }
}
