//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

import Foundation

// MARK: - Storage Manager
public class SettingsStorage {
    private let storage: SettingsStorable
    
    public init(storage: SettingsStorable = UserDefaults.standard) {
        self.storage = storage
    }
    
    public func save(_ value: Any?, forKey key: String) {
        storage.set(value, forKey: key)
    }
    
    public func getValue(forKey key: String) -> Any? {
        return storage.value(forKey: key)
    }
}
