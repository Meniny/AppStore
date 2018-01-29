//
//  AppStoreTestHelper.swift
//  AppStore
//
//  Created by Elias Abel on 4/8/17.
//  Copyright © 2017 Meniny Lab. All rights reserved.
//

import Foundation

// MARK: - Test Target Helpers

extension AppStore {
    func testSetCurrentInstalledVersion(version: String) {
        currentInstalledVersion = version
    }

    func testSetAppStoreVersion(version: String) {
        currentAppStoreVersion = version
    }

    func testIsAppStoreVersionNewer() -> Bool {
        return isAppStoreVersionNewer()
    }
}
