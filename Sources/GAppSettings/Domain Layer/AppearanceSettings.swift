//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

import Foundation

public struct AppearanceSettings {
    public var appearance: Int
    public var isAutoChangeAppearance: Bool
    public var isNightMode: Bool
    
    public init(appearance: Int, isAutoChangeAppearance: Bool, isNightMode: Bool) {
        self.appearance = appearance
        self.isAutoChangeAppearance = isAutoChangeAppearance
        self.isNightMode = isNightMode
    }
}
