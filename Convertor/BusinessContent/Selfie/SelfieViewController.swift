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

    // MARK: - Actions

    // MARK: - Life Circle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.wantsLayer = true
        self.preferredContentSize = NSSize(width: self.view.frame.size.width,
                                           height: self.view.frame.size.height)
    }

    override func viewDidAppear() {
        super.viewDidAppear()

        self.parent?.view.window?.title = self.title!
    }

}

// MARK: - MVP View

extension SelfieViewController: SelfieViewDelegate {

    // MARK: - MVPViewDelegate

    func makeUp() {
        log.message("[\(type(of: self))].\(#function), DarkMode: \(DarkMode.style)")
        view.layer?.backgroundColor = NSColor.perseusBlue.cgColor
    }

    func localize() {
        log.message("[\(type(of: self))].\(#function)")
    }

    // MARK: - SelfieViewDelegate
}
