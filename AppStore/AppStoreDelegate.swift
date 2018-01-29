//
//  AppStoreDelegate.swift
//  AppStore
//
//  Created by Elias Abel on 4/8/17.
//  Copyright © 2017 Meniny Lab. All rights reserved.
//

import Foundation

/// MARK - AppStore UpdateType

/// `UpdateType` defines what kind of update is available
/// It is used as parameter if user wants to use
/// custom alert to inform the user about an update.
///
/// - major: Major release available: A.b.c.d
/// - minor: Minor release available: a.B.c.d
/// - patch: Patch release available: a.b.C.d
/// - revision: Revision release available: a.b.c.D
/// - unknown: No information available about the update
public enum UpdateType: String {
    case major
    case minor
    case patch
    case revision
    case unknown
}

// MARK: - AppStoreDelegate Protocol

/// Delegate that handles all codepaths for AppStore upon version check completion.
public protocol AppStoreDelegate: NSObjectProtocol {
    /// User presented with update dialog.
    func appStoreDidShowUpdateDialog(alertType: AppStore.AlertType)

    /// User did click on button that launched App Store.app.
    func appStoreUserDidLaunchAppStore()

    /// User did click on button that skips version update.
    func appStoreUserDidSkipVersion()

    /// User did click on button that cancels update dialog.
    func appStoreUserDidCancel()

    /// AppStore failed to perform version check (may return system-level error).
    func appStoreDidFailVersionCheck(error: Error)

    /// AppStore performed version check and did not display alert.
    func appStoreDidDetectNewVersionWithoutAlert(message: String, updateType: UpdateType)

    /// AppStore performed version check and latest version is installed.
    func appStoreLatestVersionInstalled()
}

// MARK: - AppStoreDelegate Protocol Extension

public extension AppStoreDelegate {

    func appStoreDidShowUpdateDialog(alertType: AppStore.AlertType) {
        printMessage()
    }

    func appStoreUserDidLaunchAppStore() {
        printMessage()
    }

    func appStoreUserDidSkipVersion() {
        printMessage()
    }

    func appStoreUserDidCancel() {
        printMessage()
    }

    func appStoreDidFailVersionCheck(error: Error) {
        printMessage()
    }

    func appStoreDidDetectNewVersionWithoutAlert(message: String, updateType: UpdateType) {
        printMessage()
    }

    func appStoreLatestVersionInstalled() {
        printMessage()
    }

    private func printMessage(_ function: String = #function) {
        AppStoreLog("The default implementation of \(function) is being called. You can ignore this message if you do not care to implement this method in your `AppStoreDelegate` conforming structure.")
    }

}
