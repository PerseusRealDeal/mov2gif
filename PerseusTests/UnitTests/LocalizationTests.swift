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

    func test_Localization_of_MainScreen() {

        // arrange

        sut.loadView()
        presenter.viewDidLoad()

        // assert

        XCTAssertEqual(sut.labelGreetings.stringValue, "Greetings".localizedValue)
        XCTAssertEqual(sut.buttonExit.title, "Exit".localizedValue)
    }

    func test_Localization_of_OptionsScreen_controlDarkMode() {

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

    func test_Localization_of_OptionsScreen_controlLanguage() {

        // arrange

        sut.loadView()
        presenter.viewDidLoad()

        // assert

        XCTAssertEqual(sut.segmentedControlLanguage.label(forSegment: 2),
                       "Language: System".localizedValue)
        XCTAssertEqual(sut.segmentedControlLanguage.label(forSegment: 1),
                       "Language: Russian".localizedValue)
        XCTAssertEqual(sut.segmentedControlLanguage.label(forSegment: 0),
                       "Language: English".localizedValue)
    }
}
