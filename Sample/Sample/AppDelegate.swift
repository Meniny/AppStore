//
//  AppDelegate.swift
//  Sample
//
//  Created by 李二狗 on 2018/1/29.
//  Copyright © 2018年 Meniny Lab. All rights reserved.
//

import UIKit
import AppStore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.appStoreChecking()
        return true
    }
    
    func appStoreChecking() {
        
        // Optional
        AppStore.shared.delegate = self
        
        // Optional
        AppStore.shared.debugEnabled = true
        
        // Optional - Change the name of your app. Useful if you have a long app name and want to display a shortened version in the update dialog (e.g., the UIAlertController).
//        AppStore.shared.appName = "AppStore"
        
        // Optional - Change the various UIAlertController and UIAlertAction messaging. One or more values can be changes. If only a subset of values are changed, the defaults with which AppStore comes with will be used.
        //        AppStore.shared.alertMessaging = AppStoreAlertMessaging(updateTitle: "New Fancy Title",
        //                                                   updateMessage: "New message goes here!",
        //                                                   updateButtonMessage: "Update Now, Plz!?",
        //                                                   nextTimeButtonMessage: "OK, next time it is!",
        //                                                   skipVersionButtonMessage: "Please don't push skip, please don't!")
        
        // Optional - Defaults to .Option
        //        AppStore.shared.alertType = .option // or .force, .skip, .none
        
        // Optional - Can set differentiated Alerts for Major, Minor, Patch, and Revision Updates (Must be called AFTER appStore.alertType, if you are using appStore.alertType)
        AppStore.shared.majorUpdateAlertType = .option
        AppStore.shared.minorUpdateAlertType = .option
        AppStore.shared.patchUpdateAlertType = .option
        AppStore.shared.revisionUpdateAlertType = .option
        
        // Optional - Sets all messages to appear in Russian. AppStore supports many other languages, not just English and Russian.
        AppStore.shared.forceLanguageLocalization = AppStore.LanguageType.chineseSimplified
        
        // Optional - Set this variable if your app is not available in the U.S. App Store. List of codes: https://developer.apple.com/library/content/documentation/LanguagesUtilities/Conceptual/iTunesConnect_Guide/Chapters/AppStoreTerritories.html
//        AppStore.shared.countryCode = "CN"
        
        // Optional - Set this variable if you would only like to show an alert if your app has been available on the store for a few days.
        // This default value is set to 1 to avoid this issue: https://github.com/ArtSabintsev/AppStore#words-of-caution
        // To show the update immediately after Apple has updated their JSON, set this value to 0. Not recommended due to aforementioned reason in https://github.com/ArtSabintsev/AppStore#words-of-caution.
        //        AppStore.shared.showAlertAfterCurrentVersionHasBeenReleasedForDays = 3
        
        // Optional (Only do this if you don't call checkVersion in didBecomeActive)
        AppStore.shared.checkVersion(checkType: .immediately)
    }

}

extension AppDelegate: AppStoreDelegate {
    func appStoreDidShowUpdateDialog(alertType: AppStore.AlertType) {
        print(#function, alertType)
    }
    
    func appStoreUserDidCancel() {
        print(#function)
    }
    
    func appStoreUserDidSkipVersion() {
        print(#function)
    }
    
    func appStoreUserDidLaunchAppStore() {
        print(#function)
    }
    
    func appStoreDidFailVersionCheck(error: Error) {
        print(#function, error)
    }
    
    func appStoreLatestVersionInstalled() {
        print(#function, "Latest version of app is installed")
    }
    
    // This delegate method is only hit when alertType is initialized to .none
    func appStoreDidDetectNewVersionWithoutAlert(message: String, updateType: UpdateType) {
        print(#function, "\(message).\nRelease type: \(updateType.rawValue.capitalized)")
    }
}

