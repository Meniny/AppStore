//
//  AppStoreLookupModel.swift
//  AppStore
//
//  Created by Elias Abel on 8/6/17.
//  Copyright © 2017 Meniny Lab. All rights reserved.
//

import Foundation

// MARK: - Model representing a selection of results from the iTunes Lookup API

public struct AppStoreLookupModel: Decodable {
    private enum CodingKeys: String, CodingKey {
        case results
    }

    public let results: [LookupResults]

    public struct LookupResults: Decodable {
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

public extension AppStoreLookupModel {
    /// Generate a fake model
    ///
    /// - Parameters:
    ///   - appID: 376771144
    ///   - date: 2016-10-31T18:14:17Z
    ///   - minOS: 9.0
    ///   - version: 2.0.1.123
    /// - Returns: `AppStoreLookupModel`
    /// - Throws: Decoding error
    public static func fake(appID: String = "376771144",
                            releaseDate date: String = "2016-10-31T18:14:17Z",
                            minOS: String = "9.0",
                            version: String) throws -> AppStoreLookupModel {
        let json = """
{
 "resultCount":1,
 "results": [
{"isGameCenterEnabled":false,
"ipadScreenshotUrls":["http://is3.mzstatic.com/image/thumb/Purple62/v4/3d/63/92/3d6392aa-9fec-e9c5-570f-3c583453f14a/source/576x768bb.jpg", "http://is2.mzstatic.com/image/thumb/Purple71/v4/00/67/7d/00677d36-6e6f-c290-f31e-7ed059336e5b/source/576x768bb.jpg", "http://is3.mzstatic.com/image/thumb/Purple71/v4/f4/74/69/f4746960-46be-6373-d82b-8bd978ede85c/source/576x768bb.jpg", "http://is5.mzstatic.com/image/thumb/Purple71/v4/f8/7f/fb/f87ffb02-cb47-42ea-d4ae-d674c407e179/source/576x768bb.jpg", "http://is2.mzstatic.com/image/thumb/Purple71/v4/a5/8e/da/a58edaec-1deb-1912-45cc-ae322d589fda/source/576x768bb.jpg"], "appletvScreenshotUrls":[], "artworkUrl512":"http://is3.mzstatic.com/image/thumb/Purple62/v4/7e/f9/58/7ef95817-2a2f-3b1a-f302-5b5a7cbd8ac2/source/512x512bb.jpg", "artistViewUrl":"https://itunes.apple.com/us/developer/apple/id284417353?mt=12&uo=4", "artworkUrl60":"http://is3.mzstatic.com/image/thumb/Purple62/v4/7e/f9/58/7ef95817-2a2f-3b1a-f302-5b5a7cbd8ac2/source/60x60bb.jpg", "artworkUrl100":"http://is3.mzstatic.com/image/thumb/Purple62/v4/7e/f9/58/7ef95817-2a2f-3b1a-f302-5b5a7cbd8ac2/source/100x100bb.jpg", "kind":"software", "features":["iosUniversal"],
"supportedDevices":["iPad2Wifi-iPad2Wifi", "iPad23G-iPad23G", "iPhone4S-iPhone4S", "iPadThirdGen-iPadThirdGen", "iPadThirdGen4G-iPadThirdGen4G", "iPhone5-iPhone5", "iPodTouchFifthGen-iPodTouchFifthGen", "iPadFourthGen-iPadFourthGen", "iPadFourthGen4G-iPadFourthGen4G", "iPadMini-iPadMini", "iPadMini4G-iPadMini4G", "iPhone5c-iPhone5c", "iPhone5s-iPhone5s", "iPadAir-iPadAir", "iPadAirCellular-iPadAirCellular", "iPadMiniRetina-iPadMiniRetina", "iPadMiniRetinaCellular-iPadMiniRetinaCellular", "iPhone6-iPhone6", "iPhone6Plus-iPhone6Plus", "iPadAir2-iPadAir2", "iPadAir2Cellular-iPadAir2Cellular", "iPadMini3-iPadMini3", "iPadMini3Cellular-iPadMini3Cellular", "iPodTouchSixthGen-iPodTouchSixthGen", "iPhone6s-iPhone6s", "iPhone6sPlus-iPhone6sPlus", "iPadMini4-iPadMini4", "iPadMini4Cellular-iPadMini4Cellular", "iPadPro-iPadPro", "iPadProCellular-iPadProCellular", "iPadPro97-iPadPro97", "iPadPro97Cellular-iPadPro97Cellular", "iPhoneSE-iPhoneSE", "iPhone7-iPhone7", "iPhone7Plus-iPhone7Plus", "iPad611-iPad611", "iPad612-iPad612", "iPad71-iPad71", "iPad72-iPad72", "iPad73-iPad73", "iPad74-iPad74", "iPhone8-iPhone8", "iPhone8Plus-iPhone8Plus", "iPhoneX-iPhoneX"],
"screenshotUrls":["http://is5.mzstatic.com/image/thumb/Purple71/v4/56/28/87/56288766-ebbc-2573-e79b-07ac96265a2e/source/392x696bb.jpg", "http://is5.mzstatic.com/image/thumb/Purple62/v4/f6/6e/a5/f66ea5eb-d10b-37ed-c6b9-2df3bb5c21c3/source/392x696bb.jpg", "http://is5.mzstatic.com/image/thumb/Purple62/v4/eb/c6/21/ebc621d5-6a28-4a17-422b-21e648c9f591/source/392x696bb.jpg", "http://is1.mzstatic.com/image/thumb/Purple62/v4/f1/3e/33/f13e33c7-6309-a738-1344-001f003dd9ee/source/392x696bb.jpg", "http://is5.mzstatic.com/image/thumb/Purple62/v4/1b/d6/dd/1bd6dd5e-7fb6-f892-c73d-dbba7bb6c5c8/source/392x696bb.jpg"], "advisories":[], "languageCodesISO2A":["EN"], "sellerUrl":"https://itunesconnect.apple.com", "contentAdvisoryRating":"4+", "trackCensoredName":"iTunes Connect", "trackViewUrl":"https://itunes.apple.com/us/app/itunes-connect/id376771144?mt=8&uo=4", "averageUserRatingForCurrentVersion":2.0, "fileSizeBytes":"8176640", "userRatingCountForCurrentVersion":373, "trackContentRating":"4+", "formattedPrice":"Free", "sellerName":"Apple Inc.", "minimumOsVersion":"\(minOS)", "genreIds":["6000", "6015"], "currentVersionReleaseDate":"\(date)",
"releaseNotes":"- Addresses a problem where iTunes Connect may unexpectedly quit when tapping on an app in Recent Activity.\\n- Resolves an issue where the app status colors in Recent Activity may not update as expected.", "wrapperType":"software", "version":"\(version)", "artistId":284417353, "artistName":"Apple", "genres":["Business", "Finance"], "price":0.00,
"description":"iTunes Connect allows providers to access the apps, music, movies, TV shows, and books they have made available for download from the App Store, iTunes Store, and iBooks Store. Providers can also use iTunes Connect to check the latest trends from their iPhone, iPad, and iPod touch.", "currency":"USD", "trackId":\(appID), "trackName":"iTunes Connect", "bundleId":"com.apple.itunesconnect.mobile", "isVppDeviceBasedLicensingEnabled":true, "primaryGenreName":"Business", "releaseDate":"2010-06-10T15:19:00Z", "primaryGenreId":6000, "averageUserRating":2.5, "userRatingCount":1927}]
}
"""
        do {
            if let data = json.data(using: .utf8) {
                return try JSONDecoder().decode(AppStoreLookupModel.self, from: data)
            }
            let domain = AppStore.shared.AppStoreErrorDomain
            let error = NSError.init(domain: domain, code: 0, userInfo: nil)
            throw error
        } catch {
            throw error
        }
    }
}


