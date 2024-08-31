//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

import Foundation

// MARK: - App Settings Manager
public class AppSettingsManager {
    private let storage: SettingsStorage
    
    public init(storage: SettingsStorage = SettingsStorage()) {
        self.storage = storage
    }
    
    // Appearance Settings
    public var appearanceSettings: AppearanceSettings {
        get {
            return AppearanceSettings(
                appearance: storage.getValue(forKey: AppSettingsKeys.appearanceKey) as? Int ?? 0,
                isAutoChangeAppearance: storage.getValue(forKey: AppSettingsKeys.isAutoChangeAppearanceKey) as? Bool ?? false,
                isNightMode: AppSettingsManager.isNightTime()
            )
        }
        set {
            storage.save(newValue.appearance, forKey: AppSettingsKeys.appearanceKey)
            storage.save(newValue.isAutoChangeAppearance, forKey: AppSettingsKeys.isAutoChangeAppearanceKey)
        }
    }
    
    // iCloud Settings
    public var iCloudSettings: iCloudSettings {
        get {
            return GAppSettings.iCloudSettings(
                isiCloudEnabled: storage.getValue(forKey: AppSettingsKeys.isiCloudKey) as? Bool ?? false,
                isiCloudAutoDownload: storage.getValue(forKey: AppSettingsKeys.isiCloudAutoDownloadKey) as? Bool ?? false,
                iCloudSynchronizationEnabled: storage.getValue(forKey: AppSettingsKeys.iCloudSynchronizationSettingsKey) as? Bool ?? false
            )
        }
        set {
            storage.save(newValue.isiCloudEnabled, forKey: AppSettingsKeys.isiCloudKey)
            storage.save(newValue.isiCloudAutoDownload, forKey: AppSettingsKeys.isiCloudAutoDownloadKey)
            storage.save(newValue.iCloudSynchronizationEnabled, forKey: AppSettingsKeys.iCloudSynchronizationSettingsKey)
        }
    }
    
    // Additional settings can be managed in a similar way
    
    // Night Mode Logic
    private static func isNightTime() -> Bool {
        let calendar = Calendar.current
        let now = Date()
        let evening = calendar.date(bySettingHour: 20, minute: 0, second: 0, of: now) ?? now
        let morning = calendar.date(bySettingHour: 6, minute: 0, second: 0, of: now) ?? now
        return now > evening || now < morning
    }
}

public extension AppSettingsManager {
    static func isNightTime(for date: Date = Date()) -> Bool {
        let calendar = Calendar.current
        let evening = calendar.date(bySettingHour: 20, minute: 0, second: 0, of: date) ?? date
        let morning = calendar.date(bySettingHour: 6, minute: 0, second: 0, of: date) ?? date
        return date > evening || date < morning
    }
}
