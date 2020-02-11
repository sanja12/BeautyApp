//
//  MenuOptions.swift
//  BeautyApp
//
//  Created by Sanja Pantic on 11/02/2020.
//  Copyright © 2020 Sanja Pantic. All rights reserved.
//

import UIKit

enum MenuOptions: Int, CustomStringConvertible {
    
    case BeautySalons
    case Profile
    case Inbox
    case Notifications
    case Settings
    
    var description: String {
        switch self {
            
        case .BeautySalons:
            return "Beauty Salons"
        case .Profile:
            return "Profile"
        case .Inbox:
            return "Inbox"
        case .Notifications:
            return "Notifications"
        case .Settings:
            return "Settings"
        }
    }
    
    var image: UIImage {
        
        switch self {
            case .BeautySalons:
                return UIImage(named: "") ?? UIImage()
            case .Profile:
                return UIImage(named: "") ?? UIImage()
            case .Inbox:
                return UIImage(named: "") ?? UIImage()
            case .Notifications:
                return UIImage(named: "") ?? UIImage()
            case .Settings:
                return UIImage(named: "") ?? UIImage()
        }
    }
}
