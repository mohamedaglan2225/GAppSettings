//
//  AppSettingsManagerTests.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

import XCTest
@testable import GAppSettings

final class AppSettingsManagerTests: XCTestCase {
    
    var settingsManager: AppSettingsManager!
    var mockStorage: MockSettingsStorage!
    
    override func setUp() {
        super.setUp()
        mockStorage = MockSettingsStorage()
        settingsManager = AppSettingsManager(storage: SettingsStorage(storage: mockStorage))
    }
    
    override func tearDown() {
        settingsManager = nil
        mockStorage = nil
        super.tearDown()
    }
    
    func testAppearanceSettings_SaveAndRetrieve() {
        // Arrange
        let expectedAppearance = 1
        let expectedAutoChangeAppearance = true
        let expectedIsNightMode = false // This depends on the time the test is run
        
        // Act
        settingsManager.appearanceSettings = AppearanceSettings(
            appearance: expectedAppearance,
            isAutoChangeAppearance: expectedAutoChangeAppearance,
            isNightMode: expectedIsNightMode
        )
        
        // Assert
        let retrievedSettings = settingsManager.appearanceSettings
        XCTAssertEqual(retrievedSettings.appearance, expectedAppearance)
        XCTAssertEqual(retrievedSettings.isAutoChangeAppearance, expectedAutoChangeAppearance)
        XCTAssertEqual(retrievedSettings.isNightMode, expectedIsNightMode) // This depends on your time logic
    }
    
    func testiCloudSettings_SaveAndRetrieve() {
        // Arrange
        let expectedIsiCloudEnabled = true
        let expectedIsiCloudAutoDownload = false
        let expectedICloudSynchronizationEnabled = true
        
        // Act
        settingsManager.iCloudSettings = iCloudSettings(
            isiCloudEnabled: expectedIsiCloudEnabled,
            isiCloudAutoDownload: expectedIsiCloudAutoDownload,
            iCloudSynchronizationEnabled: expectedICloudSynchronizationEnabled
        )
        
        // Assert
        let retrievedSettings = settingsManager.iCloudSettings
        XCTAssertEqual(retrievedSettings.isiCloudEnabled, expectedIsiCloudEnabled)
        XCTAssertEqual(retrievedSettings.isiCloudAutoDownload, expectedIsiCloudAutoDownload)
        XCTAssertEqual(retrievedSettings.iCloudSynchronizationEnabled, expectedICloudSynchronizationEnabled)
    }
    
    func testIsNightTimeLogic() {
        // Arrange
        let calendar = Calendar.current
        let morning = calendar.date(bySettingHour: 6, minute: 0, second: 0, of: Date())!
        let evening = calendar.date(bySettingHour: 20, minute: 0, second: 0, of: Date())!
        
        // Act & Assert
        let isNightBeforeMorning = AppSettingsManager.isNightTime(for: morning.addingTimeInterval(-1))
        let isNightAfterEvening = AppSettingsManager.isNightTime(for: evening.addingTimeInterval(1))
        let isDaytimeBetweenMorningAndEvening = AppSettingsManager.isNightTime(for: morning.addingTimeInterval(1))
        
        XCTAssertTrue(isNightBeforeMorning)
        XCTAssertTrue(isNightAfterEvening)
        XCTAssertFalse(isDaytimeBetweenMorningAndEvening)
    }
}
