//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

import Foundation

// MARK: - Protocols
public protocol SettingsStorable {
    func set(_ value: Any?, forKey: String)
    func value(forKey: String) -> Any?
}

extension UserDefaults: SettingsStorable {}
