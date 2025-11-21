//
//  MainViewController.swift
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

class MainViewController: NSViewController {

    // MARK: - Presenter

    var presenter: MainViewPresenter?

    // MARK: - Life Circle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.wantsLayer = true
    }

    override func viewDidAppear() {
        super.viewDidAppear()

        self.parent?.view.window?.title = self.title!
        presenter?.viewDidAppear()
    }

    // MARK: - Outlets

    @IBOutlet private(set) weak var buttonExit: NSButton!
    @IBOutlet private(set) weak var labelGreetings: NSTextField!

    @IBOutlet private(set) weak var segmentedControlDarkMode: NSSegmentedControl!
    @IBOutlet private(set) weak var segmentedControlLanguage: NSSegmentedControl!

    // MARK: - Actions

    @IBAction func actionDarkModeDidChanged(_ sender: NSSegmentedControl) {
        presenter?.forceDarkMode(sender.selectedSegment)
    }

    @IBAction func actionLanguageDidChanged(_ sender: NSSegmentedControl) {
        presenter?.forceLanguage(sender.selectedSegment)
    }

    @IBAction func buttonExitTapped(_ sender: NSButton) {
        AppGlobals.quitTheApp()
    }
}

// MARK: - MVP View

extension MainViewController: MainViewDelegate {

    // MARK: - MainViewDelegate

    func onViewDidAppear() {
        updateControlDarkMode()
        updateControlLanguage()
    }

    // MARK: - MVPViewDelegate

    func setupUI() {
        log.message("[\(type(of: self))].\(#function)")
    }

    func makeUp() {

        log.message("[\(type(of: self))].\(#function), DarkMode: \(DarkMode.style)")

        labelGreetings.textColor = .perseusYellow
        view.layer?.backgroundColor = NSColor.perseusBlue.cgColor
    }

    func localize() {

        log.message("[\(type(of: self))].\(#function)")

        // NSLocale.currentLocaleDidChangeNotification

        self.view.window?.title = self.windowTitleLocalized

        labelGreetings.cell?.title = "Greetings".localizedValue
        buttonExit.title = "Exit".localizedValue

        segmentedControlDarkMode.setLabel("DarkMode: Off".localizedValue, forSegment: 0)
        segmentedControlDarkMode.setLabel("DarkMode: On".localizedValue, forSegment: 1)
        segmentedControlDarkMode.setLabel("DarkMode: Auto".localizedValue, forSegment: 2)

        segmentedControlLanguage.setLabel("Language: English".localizedValue, forSegment: 0)
        segmentedControlLanguage.setLabel("Language: Russian".localizedValue, forSegment: 1)
        segmentedControlLanguage.setLabel("Language: System".localizedValue, forSegment: 2)
    }

    private var windowTitleLocalized: String {
        return "Product Name".localizedValue
    }
}

// MARK: - Updates

extension MainViewController {

    private func updateControlDarkMode() {

        log.message("[\(type(of: self))].\(#function) \(DarkModeAgent.DarkModeUserChoice)")

        switch DarkModeAgent.DarkModeUserChoice {
        case .auto:
            segmentedControlDarkMode.selectedSegment = 2
        case .on:
            segmentedControlDarkMode.selectedSegment = 1
        case .off:
            segmentedControlDarkMode.selectedSegment = 0
        }
    }

    private func updateControlLanguage() {

        log.message("[\(type(of: self))].\(#function) \(AppOptions.languageOption)")

        switch AppOptions.languageOption {
        case .system:
            segmentedControlLanguage.selectedSegment = 2
        case .ru:
            segmentedControlLanguage.selectedSegment = 1
        case .en:
            segmentedControlLanguage.selectedSegment = 0
        }
    }

}
