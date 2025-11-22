//
//  SelfieViewController.swift
//  mov2gif
//
//  Created by Mikhail Zhigulin in 7534 (7.11.2025).
//
//  Copyright © 7534 Mikhail Zhigulin of Novosibirsk
//  Copyright © 7534 PerseusRealDeal
//
//  The year starts from the creation of the world in the Star temple
//  according to a Slavic calendar. September, the 1st of Slavic year.
//
//  See LICENSE for details. All rights reserved.
//

import Cocoa

class SelfieViewController: NSViewController {

    // MARK: - Presenter

    var presenter: SelfieViewPresenter?

    // MARK: - Outlets

    @IBOutlet weak var labelTheAppName: NSTextField!
    @IBOutlet weak var labelTheAppVersion: NSTextField!

    @IBOutlet weak var labelCopyrightText: NSTextField!
    @IBOutlet weak var labelCopyrightDetailsText: NSTextField!
    @IBOutlet weak var viewTheCreditsText: NSTextView!

    @IBOutlet weak var buttonTheAppSourceCode: NSButton!
    @IBOutlet weak var buttonTheTechnologicalTree: NSButton!

    @IBOutlet weak var buttonLicense: NSButton!
    @IBOutlet weak var buttonTerms: NSButton!

    @IBOutlet weak var buttonClose: NSButton!

    @IBOutlet weak var buttonPerseusDarkMode: NSButton!
    @IBOutlet weak var buttonPerseusGeoLocationKit: NSButton!
    @IBOutlet weak var buttonPerseusLogger: NSButton!
    @IBOutlet weak var buttonConsolePerseusLogger: NSButton!
    @IBOutlet weak var buttonPerseusTimeFormat: NSButton!
    @IBOutlet weak var buttonPerseusCompassDirection: NSButton!

    // MARK: - Actions

    @IBAction func buttonCloseTapped(_ sender: Any) {
        self.view.window?.close()
    }

    @IBAction func buttonTermsTapped(_ sender: Any) {
        AppGlobals.openDefaultBrowser(string: linkTermsAndConditions)
    }

    @IBAction func buttonLicenseTapped(_ sender: Any) {
        AppGlobals.openDefaultBrowser(string: linkLicense)
    }

    @IBAction func buttonTheTechnologicalTreeTapped(_ sender: Any) {
        AppGlobals.openDefaultBrowser(string: linkTheTechnologicalTree)
    }

    @IBAction func buttonTheAppSourceCodeTapped(_ sender: Any) {
        AppGlobals.openDefaultBrowser(string: linkTheAppSourceCode)
    }

    @IBAction func buttonPerseusDarkModeTapped(_ sender: Any) {
        AppGlobals.openDefaultBrowser(string: linkPerseusDarkMode)
    }

    @IBAction func buttonPerseusGeoLocationKitTapped(_ sender: Any) {
        AppGlobals.openDefaultBrowser(string: linkPerseusGeoLocationKit)
    }

    @IBAction func buttonPerseusLoggerTapped(_ sender: Any) {
        AppGlobals.openDefaultBrowser(string: linkPerseusLogger)
    }

    @IBAction func buttonConsolePerseusLoggerTapped(_ sender: Any) {
        AppGlobals.openDefaultBrowser(string: linkConsolePerseusLogger)
    }

    @IBAction func buttonPerseusTimeFormatTapped(_ sender: Any) {
        AppGlobals.openDefaultBrowser(string: linkPerseusTimeFormat)
    }

    @IBAction func buttonPerseusCompassDirectionTapped(_ sender: Any) {
        AppGlobals.openDefaultBrowser(string: linkPerseusCompassDirection)
    }
}

// MARK: - MVP View

extension SelfieViewController: SelfieViewDelegate {

    // MARK: - MVPViewDelegate

    func setupUI() {

        log.message("[\(type(of: self))].\(#function)")

        self.view.wantsLayer = true

        buttonTheAppSourceCode.toolTip = linkTheAppSourceCode
        buttonTheTechnologicalTree.toolTip = linkTheTechnologicalTree

        buttonPerseusDarkMode.toolTip = linkPerseusDarkMode
        buttonPerseusGeoLocationKit.toolTip = linkPerseusGeoLocationKit

        buttonPerseusCompassDirection.toolTip = linkPerseusCompassDirection
        buttonPerseusTimeFormat.toolTip = linkPerseusTimeFormat
        buttonPerseusLogger.toolTip = linkPerseusLogger
        buttonConsolePerseusLogger.toolTip = linkConsolePerseusLogger

        viewTheCreditsText.backgroundColor = .clear
        viewTheCreditsText.isEditable = false
        viewTheCreditsText.alignment = .center
        viewTheCreditsText.font = NSFont.systemFont(ofSize: 20.0)
    }

    func makeUp() {

        log.message("[\(type(of: self))].\(#function), DarkMode: \(DarkMode.style)")

        // view.layer?.backgroundColor = NSColor.perseusBlue.cgColor

        if isHighSierra {
            view.window?.appearance = DarkModeAgent.DarkModeUserChoice == .on ?
            DARK_APPEARANCE_DEFAULT_IN_USE : LIGHT_APPEARANCE_DEFAULT_IN_USE
        }
    }

    func localize() {

        log.message("[\(type(of: self))].\(#function)")

        self.view.window?.title = "Title: Convertor".localizedValue

        buttonTheAppSourceCode.title = "Button: The App Source Code".localizedValue
        buttonTheTechnologicalTree.title = "Button: The Technological Tree".localizedValue
        buttonLicense.title = "Button: License".localizedValue
        buttonTerms.title = "Button: Terms & Conditions".localizedValue
        buttonClose.title = "Button: Close".localizedValue

        labelTheAppName.stringValue = "Product Name".localizedValue
        labelTheAppVersion.stringValue = theAppVersionLocalized
        labelCopyrightText.stringValue = "Label: Copyright Notice".localizedValue
        labelCopyrightDetailsText.stringValue = "Label: Copyright Details".localizedValue

        viewTheCreditsText.string = theCredits
    }

    var theAppVersionLocalized: String {
        guard
            let ver = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")
        else {
            return ""
        }
        return "Label: The App Version".localizedValue + ": \(ver)"
    }

    var theCredits: String {
        return """
        \n\("Label: Credits".localizedValue)\n
        \("Label: Balancing and Control".localizedValue) \("Label: Author".localizedValue)
        \("Label: Writing".localizedValue) \("Label: Author".localizedValue)
        \("Label: Documenting".localizedValue) \("Label: Author".localizedValue)
        \("Label: Artworking".localizedValue) \("Label: Author".localizedValue)
        \("Label: EN Expectation".localizedValue) \("Label: Author".localizedValue)
        \("Label: RU Expectation".localizedValue) \("Label: Author".localizedValue)
        """
    }
}
