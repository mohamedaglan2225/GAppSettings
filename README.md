# GAppSettings

GAppSettings is a customizable app settings manager for iOS applications, providing support for storing and retrieving various user preferences, including appearance settings, iCloud settings, and other app-specific configurations. This package simplifies managing user settings using the UserDefaults storage or any custom storage conforming to the SettingsStorable protocol.

## Features

- Manage appearance settings, including dark mode and automatic appearance switching.
- Handle iCloud-related settings such as iCloud sync and auto-download.
- Easily extendable to manage any other app-specific settings.
- Use a flexible storage system, with the default being UserDefaults, but easily replaceable with any storage conforming to SettingsStorable.

## Installation

### Swift Package Manager

To integrate `GAppSettings` into your project using Swift Package Manager, add it to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/mohamedaglan2225/GAppSettings.git", from: "1.0.0")
]
```

## Usage

### 1. import GAppSettings

```
import GAppSettings
```

### 2. Managing Appearance Settings

```
let settingsManager = AppSettingsManager()

// Get appearance settings
let currentAppearance = settingsManager.appearanceSettings

// Set new appearance settings
settingsManager.appearanceSettings = AppearanceSettings(appearance: 1, isAutoChangeAppearance: true, isNightMode: false)


```

### 3. Managing iCloud Settings

```
// Get iCloud settings
let iCloudSettings = settingsManager.iCloudSettings

// Set iCloud settings
settingsManager.iCloudSettings = iCloudSettings(isiCloudEnabled: true, isiCloudAutoDownload: true, iCloudSynchronizationEnabled: true)


```

### 5. Custom Storage

```
class CustomStorage: SettingsStorable {
    private var storage = [String: Any]()
    
    func set(_ value: Any?, forKey key: String) {
        storage[key] = value
    }
    
    func value(forKey key: String) -> Any? {
        return storage[key]
    }
}

// Use the custom storage in AppSettingsManager
let customStorage = CustomStorage()
let customSettingsManager = AppSettingsManager(storage: SettingsStorage(storage: customStorage))


```



### 6. Example

```
let settingsManager = AppSettingsManager()

if settingsManager.appearanceSettings.isNightMode {
    // Update UI for night mode
    print("Night mode is active")
} else {
    // Update UI for day mode
    print("Day mode is active")
}


```













