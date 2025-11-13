//
//  LocalizationTests.swift
//  PerseusTests
//
//  Created by Mikhail A. Zhigulin of Novosibirsk.
//
//  Unlicensed Free Software.
//

import XCTest
@testable import mov2gif

class LocalizationTests: XCTestCase {

    private var windowController: MainWindowController!
    private var sut: ViewController!

    override func setUp() {
        super.setUp()

        windowController = MainWindowController.storyboardInstance()
        sut = windowController.contentViewController as? ViewController
    }

    // func test_zero() { XCTFail("Tests not yet implemented in \(type(of: self)).") }
    // func test_the_first_success() { XCTAssertTrue(true, "It's done!") }

    func test_Localization_of_MainScreen() {

        // arrange

        sut.loadView()

        // assert

        XCTAssertEqual(sut.labelGreetings.stringValue, "Greetings".localizedValue)
        XCTAssertEqual(sut.buttonExit.title, "Exit".localizedValue)
    }
}
