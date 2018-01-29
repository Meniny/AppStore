//
//  AppStoreLookupModel.swift
//  AppStore
//
//  Created by Elias Abel on 8/6/17.
//  Copyright © 2017 Meniny Lab. All rights reserved.
//

import Foundation

// MARK: - Model representing a selection of results from the iTunes Lookup API

struct AppStoreLookupModel: Decodable {
    private enum CodingKeys: String, CodingKey {
        case results
    }

    let results: [Results]

    struct Results: Decodable {
        private enum CodingKeys: String, CodingKey {
            case appID = "trackId"
            case currentVersionReleaseDate
            case minimumOSVersion = "minimumOsVersion"
            case version
        }

        let appID: Int
        let currentVersionReleaseDate: String
        let minimumOSVersion: String
        let version: String
    }
}
