//
//  LoggerViewController.swift
//  mov2gif
//
//  Created by Mikhail Zhigulin in 7534 (23.11.2025).
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

class LoggerViewController: NSViewController {

    // MARK: - Presenter

    var presenter: LoggerViewPresenter?

    // MARK: - Outlets

    @IBOutlet private(set) weak var buttonClose: NSButton!
    @IBOutlet private(set) weak var texViewLogMessages: NSTextView!

    // MARK: - Actions

    @IBAction func buttonCloseTapped(_ sender: Any) {
        self.view.window?.close()
    }
}

// MARK: - MVP View

extension LoggerViewController: LoggerViewDelegate {

    // MARK: - MVPViewDelegate

    func setupUI() {

        log.message("[\(type(of: self))].\(#function)")

        texViewLogMessages.backgroundColor = .clear
        texViewLogMessages.textColor = .darkGray
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

        self.view.window?.title = "Button: Logger".localizedValue
        buttonClose.title = "Button: Close".localizedValue
    }
}
