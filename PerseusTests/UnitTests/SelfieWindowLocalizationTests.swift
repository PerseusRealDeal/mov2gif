//
//  SelfieWindowLocalizationTests.swift
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

class SelfieWindowLocalizationTests: XCTestCase {

    private var selfieController: SelfieWindowController!
    private var sut: SelfieViewController!

    private var presenter: SelfieViewPresenter!

    override func setUp() {
        super.setUp()

        selfieController = SelfieWindowController.storyboardInstance()
        sut = selfieController.contentViewController as? SelfieViewController

        if let vc = sut {
            presenter = SelfieViewPresenter(view: vc)
        }
    }

    // func test_zero() { XCTFail("Tests not yet implemented in \(type(of: self)).") }
    // func test_the_first_success() { XCTAssertTrue(true, "It's done!") }

    func test_localization_of_SelfieScreen() {

        // arrange

        sut.loadView()
        presenter.viewDidLoad()

        // assert

        XCTAssertEqual(sut.view.window?.title, "Title: Convertor".localizedValue)

        XCTAssertEqual(sut.labelCopyrightText.stringValue,
                       "Label: Copyright Notice".localizedValue)
        XCTAssertEqual(sut.labelCopyrightDetailsText.stringValue,
                       "Label: Copyright Details".localizedValue)
        XCTAssertEqual(sut.viewTheCreditsText.string,
                       sut.theCredits)

        XCTAssertEqual(sut.buttonTheAppSourceCode.title,
                       "Button: The App Source Code".localizedValue)
        XCTAssertEqual(sut.buttonTheTechnologicalTree.title,
                       "Button: The Technological Tree".localizedValue)
        XCTAssertEqual(sut.buttonLicense.title,
                       "Button: License".localizedValue)
        XCTAssertEqual(sut.buttonTerms.title,
                       "Button: Terms & Conditions".localizedValue)
        XCTAssertEqual(sut.buttonClose.title,
                       "Button: Close".localizedValue)

        XCTAssertEqual(sut.labelTheAppName.stringValue,
                       "Product Name".localizedValue)
        XCTAssertEqual(sut.labelTheAppVersion.stringValue,
                       sut.theAppVersionLocalized)
    }
}
