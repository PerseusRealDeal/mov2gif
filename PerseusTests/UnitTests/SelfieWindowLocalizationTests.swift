//
//  SelfieWindowLocalizationTests.swift
//  PerseusTests
//
//  Created by Mikhail Zhigulin of Novosibirsk in 7534 (22.11.2025).
//
//  The year starts from the creation of the world in the Star temple
//  according to a Slavic calendar. September, the 1st of Slavic year.
//
//  Unlicensed Free Software
//
//  This is SelfieWindowLocalizationTests.swift
//
//  This is free and unencumbered software released into the public domain.
//
//  Anyone is free to copy, modify, publish, use, compile, sell, or
//  distribute this software, either in source code form or as a compiled
//  binary, for any purpose, commercial or non-commercial, and by any
//  means.
//
//  In jurisdictions that recognize copyright laws, the author or authors
//  of this software dedicate any and all copyright interest in the
//  software to the public domain. We make this dedication for the benefit
//  of the public at large and to the detriment of our heirs and
//  successors. We intend this dedication to be an overt act of
//  relinquishment in perpetuity of all present and future rights to this
//  software under copyright law.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//  IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
//  OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
//  ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//
//  For more information, please refer to <http://unlicense.org/>
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

        XCTAssertEqual(sut.labelTheAppSourceCode.text,
                       "Button: The App Source Code".localizedValue)
        XCTAssertEqual(sut.labelTheTechnologicalTree.text,
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
