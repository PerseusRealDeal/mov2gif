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

    // MARK: - Life Circle

    override func viewDidAppear() {
        super.viewDidAppear()

        presenter?.viewDidAppear()
    }

    // MARK: - Outlets

    @IBOutlet private(set) weak var buttonClose: NSButton!
    @IBOutlet private(set) weak var texViewMessages: NSTextView!
    @IBOutlet private(set) weak var buttonTurned: NSButton!
    @IBOutlet private(set) weak var segmentedControlOutput: NSSegmentedControl!
    @IBOutlet private(set) weak var comboBoxFormat: NSComboBox!
    @IBOutlet private(set) weak var comboBoxLevel: NSComboBox!

    // MARK: - Actions

    @IBAction func buttonCloseTapped(_ sender: Any) {
        self.view.window?.close()
    }

    @IBAction func buttonTurnedTapped(_ sender: NSButton) {
        presenter?.forceTurned(sender.state == .on ? true : false)
    }

    @IBAction func actionOutputDidChanged(_ sender: NSSegmentedControl) {
        presenter?.forceOutput(sender.selectedSegment)
    }

    @IBAction func actionFormatDidChanged(_ sender: NSComboBox) {
        presenter?.forceFormat(sender.stringValue)
    }

    @IBAction func actionLevelDidChanged(_ sender: NSComboBox) {
        presenter?.forceLevel(sender.indexOfSelectedItem)
    }
}

// MARK: - MVP View

extension LoggerViewController: LoggerViewDelegate {

    // MARK: - MainViewDelegate

    func onViewDidAppear() {
        refresh()
    }

    func refreshMessages() {
        texViewMessages.string = report.text
    }

    func clear() {
        texViewMessages.string = ""
    }

    // MARK: - MVPViewDelegate

    func setupUI() {

        log.message("[\(type(of: self))].\(#function)")

        texViewMessages.backgroundColor = .clear
        texViewMessages.textColor = .darkGray
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

// MARK: - Refresh

extension LoggerViewController {

    private func refresh() {

        buttonTurned.state = log.turned == .on ? .on : .off

        comboBoxFormat.removeAllItems()
        comboBoxLevel.removeAllItems()

        for item in PerseusLogger.MessageFormat.allCases {
            comboBoxFormat.addItem(withObjectValue: "\(item)")
        }

        for item in PerseusLogger.Level.allCases {
            comboBoxLevel.addItem(withObjectValue: "\(item)")
        }

        comboBoxFormat.selectItem(withObjectValue: "\(log.format)")
        comboBoxLevel.selectItem(withObjectValue: "\(log.level)")

        switch log.output {
        case .standard:
            segmentedControlOutput.selectedSegment = 0
        case .consoleapp:
            segmentedControlOutput.selectedSegment = 1
        case .custom:
            segmentedControlOutput.selectedSegment = 2
        }
    }
}
