//
//  ViewController.swift
//  T3Project
//
//  Created by Mikhail A. Zhigulin of Novosibirsk.
//
//  Unlicensed Free Software.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet private(set) weak var buttonExit: NSButton!
    @IBOutlet private(set) weak var labelGreetings: NSTextField!

    @IBAction func buttonExitTapped(_ sender: NSButton) {
        AppGlobals.quitTheApp()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.wantsLayer = true

        DarkModeAgent.register(stakeholder: self, selector: #selector(makeUp))
        localizeContent()
    }

    @objc private func makeUp() {

        log.message("[\(type(of: self))].\(#function), DarkMode: \(DarkMode.style)")

        labelGreetings.textColor = .perseusYellow
        view.layer?.backgroundColor = NSColor.perseusBlue.cgColor
    }

    private func localizeContent() {
        // NSLocale.currentLocaleDidChangeNotification
        labelGreetings.cell?.title = "Greetings".localizedValue
        buttonExit.title = "Exit".localizedValue
    }
}
