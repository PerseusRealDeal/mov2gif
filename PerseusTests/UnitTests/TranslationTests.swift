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

        XCTAssertEqual("Label: Copyright Notice".localizedExpectation,
                       "Label: Copyright Notice".localizedValue)

        XCTAssertEqual("Label: Copyright Details".localizedExpectation,
                       "Label: Copyright Details".localizedValue)

        XCTAssertEqual("Label: Credits".localizedExpectation,
                       "Label: Credits".localizedValue)

        XCTAssertEqual("Label: Balancing and Control".localizedExpectation,
                       "Label: Balancing and Control".localizedValue)

        XCTAssertEqual("Label: Writing".localizedExpectation,
                       "Label: Writing".localizedValue)

        XCTAssertEqual("Label: Documenting".localizedExpectation,
                       "Label: Documenting".localizedValue)

        XCTAssertEqual("Label: Artworking".localizedExpectation,
                       "Label: Artworking".localizedValue)

        XCTAssertEqual("Label: EN Expectation".localizedExpectation,
                       "Label: EN Expectation".localizedValue)

        XCTAssertEqual("Label: RU Expectation".localizedExpectation,
                       "Label: RU Expectation".localizedValue)

        XCTAssertEqual("Label: Author".localizedExpectation,
                       "Label: Author".localizedValue)

        XCTAssertEqual("Button: Selfie".localizedExpectation,
                       "Button: Selfie".localizedValue)

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

        XCTAssertEqual("Title: Convertor".localizedExpectation,
                       "Title: Convertor".localizedValue)

        XCTAssertEqual("Label: The App Version".localizedExpectation,
                       "Label: The App Version".localizedValue)

        XCTAssertEqual("Button: The App Source Code".localizedExpectation,
                       "Button: The App Source Code".localizedValue)

        XCTAssertEqual("Button: The Technological Tree".localizedExpectation,
                       "Button: The Technological Tree".localizedValue)

        XCTAssertEqual("Button: License".localizedExpectation,
                       "Button: License".localizedValue)

        XCTAssertEqual("Button: Terms & Conditions".localizedExpectation,
                       "Button: Terms & Conditions".localizedValue)

        XCTAssertEqual("Button: Close".localizedExpectation,
                       "Button: Close".localizedValue)
    }
}
