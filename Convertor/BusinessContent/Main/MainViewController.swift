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

    // MARK: - Outlets

    @IBOutlet private(set) weak var buttonExit: NSButton!
    @IBOutlet private(set) weak var labelGreetings: NSTextField!
    @IBOutlet private(set) weak var segmentedControl: NSSegmentedControl!

    // MARK: - Actions

    @IBAction func segmentedControlValueChanged(_ sender: NSSegmentedControl) {
        presenter?.changeDarkModeValue(selected: sender.selectedSegment)
    }

    @IBAction func buttonExitTapped(_ sender: NSButton) {
        AppGlobals.quitTheApp()
    }

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
}

// MARK: - MVP View

extension MainViewController: MainViewDelegate {

    // MARK: - MVPViewDelegate

    func makeUp() {

        log.message("[\(type(of: self))].\(#function), DarkMode: \(DarkMode.style)")

        labelGreetings.textColor = .perseusYellow
        view.layer?.backgroundColor = NSColor.perseusBlue.cgColor
    }

    func localize() {

        log.message("[\(type(of: self))].\(#function)")

        // NSLocale.currentLocaleDidChangeNotification
        labelGreetings.cell?.title = "Greetings".localizedValue
        buttonExit.title = "Exit".localizedValue
    }

    // MARK: - MainMVPViewDelegate

    func updateDarkModeOption(selected: Int) {
        segmentedControl.selectedSegment = selected
    }
}
