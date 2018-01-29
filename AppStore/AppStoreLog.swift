//
//  AppStoreLog.swift
//  AppStore
//
//  Created by Elias Abel on 8/5/17.
//  Copyright © 2017 Meniny Lab. All rights reserved.
//

import Foundation

// MARK: - Log and decorate AppStore-specific messages to the console.

struct AppStoreLog {

    @discardableResult
    init(_ message: String) {
        print("[AppStore] \(message)")
    }

}
