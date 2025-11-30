//
//  BundleTests.swift
//  PerseusTests
//
//  Created by Mikhail Zhigulin in 7534.
//
//  Copyright © 7534 Mikhail Zhigulin of Novosibirsk
//  Copyright © 7534 PerseusRealDeal
//
//  The year starts from the creation of the world in the Star temple
//  according to a Slavic calendar. September, the 1st of Slavic year.
//
//  See LICENSE for details. All rights reserved.
//

import XCTest
@testable import mov2gif

// MARK: - Release notes

let bundleShortVersion = "0.0.3"
let bundleVersion = "0"

// MARK: - Customer expectations, requirements

let productName = "Product Name".localizedExpectation

// MARK: - Release check list

class BundleTests: XCTestCase {

    // func test_zero() { XCTFail("Tests not yet implemented in \(type(of: self)).") }
    // func test_the_first_success() { XCTAssertTrue(true, "It's done!") }

    func test_BundleDisplayName() {

        // arrange

        // InfoPlist.strings localized.
        let bundleDisplayNameInfoPlist = "CFBundleDisplayName".localizedInfoPlist
        // Localizable.strings.
        let productNameLocalizable = "Product Name".localizedValue

        // assert

        XCTAssertEqual(productName, bundleDisplayNameInfoPlist)
        XCTAssertEqual(bundleDisplayNameInfoPlist, productNameLocalizable)
    }

    func test_BundleName() {

        // arrange

        // InfoPlist.strings localized.
        let bundleNameInfoPlist = "CFBundleName".localizedInfoPlist
        // Localizable.strings.
        let productNameLocalizable = "Product Name".localizedValue

        // assert

        XCTAssertEqual(productName, bundleNameInfoPlist)
        XCTAssertEqual(bundleNameInfoPlist, productNameLocalizable)
    }

    func test_BundleShortVersion() {

        // InfoPlist.strings.
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")

        XCTAssertEqual(bundleShortVersion, version as? String)
    }

    func test_BundleVersion() {

        // arrange

        // InfoPlist.strings.
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion")

        // assert

        XCTAssertEqual(bundleVersion, version as? String)
    }
}
