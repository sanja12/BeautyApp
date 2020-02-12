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
                return UIImage(named: "beauty2") ?? UIImage()
            case .Profile:
                return UIImage(named: "beauty2") ?? UIImage()
            case .Inbox:
                return UIImage(named: "beauty2") ?? UIImage()
            case .Notifications:
                return UIImage(named: "beauty2") ?? UIImage()
            case .Settings:
                return UIImage(named: "beauty2") ?? UIImage()
        }
    }
}

public enum SubmenuOptions: Int, CustomStringConvertible {

    case Hair
    case Nails
    case MakeUp

    public var description: String {
        
        switch self {
            case .Hair:
                return "Hair"
            case .Nails:
                return "Nails"
            case .MakeUp:
                return "Make Up"
        }
    }
}
