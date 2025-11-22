//
//  MainWindowLocalizationTests.swift
//  PerseusTests
//
//  Created by Mikhail Zhigulin in 7534 (22.11.2025).
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

class MainWindowLocalizationTests: XCTestCase {

    private var windowController: MainWindowController!
    private var sut: MainViewController!

    private var presenter: MainViewPresenter!

    override func setUp() {
        super.setUp()

        windowController = MainWindowController.storyboardInstance()
        sut = windowController.contentViewController as? MainViewController

        if let vc = sut {
            presenter = MainViewPresenter(view: vc)
        }
    }

    // func test_zero() { XCTFail("Tests not yet implemented in \(type(of: self)).") }
    // func test_the_first_success() { XCTAssertTrue(true, "It's done!") }

    func test_localization_of_MainScreen() {

        // arrange

        sut.loadView()
        presenter.viewDidLoad()

        // assert

        XCTAssertEqual(sut.view.window?.title, sut.windowTitleLocalized)

        XCTAssertEqual(sut.labelGreeting.stringValue, "Greetings".localizedValue)
        XCTAssertEqual(sut.buttonSelfie.title, "Selfie".localizedValue)

    }

    func test_localization_of_options_controlDarkMode() {

        // arrange

        sut.loadView()
        presenter.viewDidLoad()

        // assert

        XCTAssertEqual(sut.segmentedControlDarkMode.label(forSegment: 0),
                       "DarkMode: Off".localizedValue)
        XCTAssertEqual(sut.segmentedControlDarkMode.label(forSegment: 1),
                       "DarkMode: On".localizedValue)
        XCTAssertEqual(sut.segmentedControlDarkMode.label(forSegment: 2),
                       "DarkMode: Auto".localizedValue)
    }

    func test_localization_of_options_controlLanguage() {

        // arrange

        sut.loadView()
        presenter.viewDidLoad()

        // assert

        XCTAssertEqual(sut.segmentedControlLanguage.label(forSegment: 0),
                       "Language: English".localizedValue)
        XCTAssertEqual(sut.segmentedControlLanguage.label(forSegment: 1),
                       "Language: Russian".localizedValue)
        XCTAssertEqual(sut.segmentedControlLanguage.label(forSegment: 2),
                       "Language: System".localizedValue)
    }
}
