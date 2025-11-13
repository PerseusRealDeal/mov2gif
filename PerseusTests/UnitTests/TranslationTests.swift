//
//  TranslationTests.swift
//  PerseusTests
//
//  Created by Mikhail A. Zhigulin of Novosibirsk.
//
//  Unlicensed Free Software.
//

import XCTest
@testable import mov2gif

class TranslationTests: XCTestCase {

    // func test_zero() { XCTFail("Tests not yet implemented in \(type(of: self)).") }
    // func test_the_first_success() { XCTAssertTrue(true, "It's done!") }

    // MARK: - Main Screen

    func test_Expectations() {

        // assert

        XCTAssertEqual("Greetings".localizedExpectation,
                       "Greetings".localizedValue)

        XCTAssertEqual("Exit".localizedExpectation,
                       "Exit".localizedValue)

        XCTAssertEqual("Settings...".localizedExpectation,
                       "Settings...".localizedValue)

        XCTAssertEqual("Preferences...".localizedExpectation,
                       "Preferences...".localizedValue)
    }
}
