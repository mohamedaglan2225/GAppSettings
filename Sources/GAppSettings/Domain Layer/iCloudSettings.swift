//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

import Foundation

public struct iCloudSettings {
    public var isiCloudEnabled: Bool
    public var isiCloudAutoDownload: Bool
    public var iCloudSynchronizationEnabled: Bool
    
    public init(isiCloudEnabled: Bool, isiCloudAutoDownload: Bool, iCloudSynchronizationEnabled: Bool) {
        self.isiCloudEnabled = isiCloudEnabled
        self.isiCloudAutoDownload = isiCloudAutoDownload
        self.iCloudSynchronizationEnabled = iCloudSynchronizationEnabled
    }
}
