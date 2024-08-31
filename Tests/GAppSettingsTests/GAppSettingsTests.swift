import XCTest
@testable import GAppSettings

final class MockSettingsStorage: SettingsStorable {
    private var storage: [String: Any] = [:]
    
    func set(_ value: Any?, forKey key: String) {
        storage[key] = value
    }
    
    func value(forKey key: String) -> Any? {
        return storage[key]
    }
}
