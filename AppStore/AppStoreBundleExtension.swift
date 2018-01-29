//
//  AppStoreBundleExtension.swift
//  AppStore
//
//  Created by Elias Abel on 3/17/17.
//  Copyright © 2017 Meniny Lab. All rights reserved.
//

import Foundation

// MARK: - Bundle Extension for AppStore

extension Bundle {
    class func bundleID() -> String? {
        return Bundle.main.bundleIdentifier
    }

    class func appStoreBundlePath() -> String {
        return Bundle(for: AppStore.self).path(forResource: "AppStore", ofType: "bundle") as String!
    }

    class func appStoreForcedBundlePath(forceLanguageLocalization: AppStore.LanguageType) -> String {
        let path = appStoreBundlePath()
        let name = forceLanguageLocalization.rawValue
        let res = Bundle(path: path)?.path(forResource: name, ofType: "lproj")
        return res!
    }
    
    static let tableName = "AppStoreLocalizable"

    class func localizedString(forKey key: String, forceLanguageLocalization: AppStore.LanguageType?) -> String {
        var path = appStoreBundlePath()

        if let forceLanguageLocalization = forceLanguageLocalization {
            path = appStoreForcedBundlePath(forceLanguageLocalization: forceLanguageLocalization)
        }

        let res = Bundle(path: path)?.localizedString(forKey: key, value: key, table: Bundle.tableName)
        return res!
    }

    class func bestMatchingAppName() -> String {
        let bundleDisplayName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
        let bundleName = Bundle.main.object(forInfoDictionaryKey: kCFBundleNameKey as String) as? String

        return bundleDisplayName ?? bundleName ?? ""
    }
}

// MARK: - Bundle Extension for Testing AppStore

extension Bundle {
    func testLocalizedString(forKey key: String, forceLanguageLocalization: AppStore.LanguageType?) -> String {
        return Bundle.localizedString(forKey: key, forceLanguageLocalization: forceLanguageLocalization)
    }
}
