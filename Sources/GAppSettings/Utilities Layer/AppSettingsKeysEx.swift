//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

import Foundation
import UIKit

public extension AppSettingsKeys {
    static var isLockAppOrientation: Bool {
        set { UserDefaults.standard.set(newValue, forKey: isLockAppOrientationKey) }
        get { return UserDefaults.standard.bool(forKey: isLockAppOrientationKey) }
    }
    
    static var appLockOrientation: UIInterfaceOrientationMask {
        set { UserDefaults.standard.set(newValue.rawValue, forKey: appLockOrientationKey) }
        get {
            let rawValue = UInt(UserDefaults.standard.integer(forKey: appLockOrientationKey))
            return isLockAppOrientation ? UIInterfaceOrientationMask(rawValue: rawValue) : .all
        }
    }
}


