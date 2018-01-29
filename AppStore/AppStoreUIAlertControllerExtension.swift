//
//  AppStoreUIAlertControllerExtension.swift
//  AppStore
//
//  Created by Elias Abel on 3/17/17.
//  Copyright © 2017 Meniny Lab. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIAlertController Extension for AppStore

extension UIAlertController {
    func show() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = AppStoreViewController()
        window.windowLevel = UIWindowLevelAlert + 1

        AppStore.shared.updaterWindow = window

        window.makeKeyAndVisible()
        window.rootViewController!.present(self, animated: true, completion: nil)
    }
}
