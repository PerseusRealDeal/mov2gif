//
//  TranslationTests.swift
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

class TranslationTests: XCTestCase {

    // func test_zero() { XCTFail("Tests not yet implemented in \(type(of: self)).") }
    // func test_the_first_success() { XCTAssertTrue(true, "It's done!") }

    // MARK: - Main Screen

    func test_expectations() {

        // assert

        XCTAssertEqual("Greetings".localizedExpectation,
                       "Greetings".localizedValue)

        XCTAssertEqual("Have a great time".localizedExpectation,
                       "Have a great time".localizedValue)

        XCTAssertEqual("Selfie".localizedExpectation,
                       "Selfie".localizedValue)

        XCTAssertEqual("Message: Dark Mode forced".localizedExpectation,
                       "Message: Dark Mode forced".localizedValue)

        XCTAssertEqual("Message: Language forced".localizedExpectation,
                       "Message: Language forced".localizedValue)

        XCTAssertEqual("DarkMode: Auto".localizedExpectation,
                       "DarkMode: Auto".localizedValue)

        XCTAssertEqual("DarkMode: On".localizedExpectation,
                       "DarkMode: On".localizedValue)

        XCTAssertEqual("DarkMode: Off".localizedExpectation,
                       "DarkMode: Off".localizedValue)

        XCTAssertEqual("Language: System".localizedExpectation,
                       "Language: System".localizedValue)

        XCTAssertEqual("Language: Russian".localizedExpectation,
                       "Language: Russian".localizedValue)

        XCTAssertEqual("Language: English".localizedExpectation,
                       "Language: English".localizedValue)
    }
}
