//
//  SelfieViewController.swift
//  mov2gif
//
//  Created by Mikhail Zhigulin in 7532 (7.11.2025).
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

    @IBOutlet weak var buttonTheAppSourceCode: NSButton!
    @IBOutlet weak var buttonTheTechnologicalTree: NSButton!

    @IBOutlet weak var buttonLicense: NSButton!
    @IBOutlet weak var buttonTerms: NSButton!

    @IBOutlet weak var buttonClose: NSButton!

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

    // MARK: - Life Circle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.wantsLayer = true
        // self.preferredContentSize = NSSize(width: self.view.frame.size.width,
        //                                    height: self.view.frame.size.height)
    }

    override func viewDidAppear() {
        super.viewDidAppear()

        self.parent?.view.window?.title = self.title!
    }
}

// MARK: - MVP View

extension SelfieViewController: SelfieViewDelegate {

    // MARK: - SelfieViewDelegate

    // MARK: - MVPViewDelegate

    func setupUI() {
        log.message("[\(type(of: self))].\(#function)")
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

        self.view.window?.title = "Convertor".localizedValue

        buttonTheAppSourceCode.title = "Button: The App Source Code".localizedValue
        buttonTheTechnologicalTree.title = "Button: The Technological Tree".localizedValue
        buttonLicense.title = "Button: License".localizedValue
        buttonTerms.title = "Button: Terms & Conditions".localizedValue
        buttonClose.title = "Button: Close".localizedValue

        labelTheAppName.stringValue = "Product Name".localizedValue
        labelTheAppVersion.stringValue = theAppVersionLocalized
    }

    var theAppVersionLocalized: String {
        guard
            let ver = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")
        else {
            return ""
        }
        return "Label: The App Version".localizedValue + ": \(ver)"
    }
}
