//
//  MainWindowController.swift, MainWindowController.storyboard
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

extension MainWindowController {

    class func storyboardInstance() -> MainWindowController {

        let storyboard = NSStoryboard(name: String(describing: self), bundle: nil)
        let screen = storyboard.instantiateInitialController() as? MainWindowController

        if let vc = screen?.contentViewController as? MainViewController {
            vc.presenter = MainViewPresenter(view: vc)
            vc.presenter?.viewDidLoad()
        }

        // Do default setup; don't set any parameter causing loadView up, breaks unit tests

        // screen?.modalTransitionStyle = UIModalTransitionStyle.partialCurl
        // screen?.view.backgroundColor = UIColor.yellow

        return screen ?? MainWindowController()
    }
}

class MainWindowController: NSWindowController, NSWindowDelegate {

    private lazy var logger = { () -> LoggerWindowController in
        return LoggerWindowController.storyboardInstance()
    }()

    private lazy var selfie = { () -> SelfieWindowController in
        return SelfieWindowController.storyboardInstance()
    }()

    // MARK: - Life Circle

    override func windowDidLoad() {
        super.windowDidLoad()

        log.message("[\(type(of: self))].\(#function)")

        if let window = self.window {
            window.delegate = self
        } else {
            log.message("[\(type(of: self))].\(#function) window instance is nil", .error)
        }
    }

    // MARK: - Actions

    @IBAction func showSelfieWindow(_ sender: NSMenuItem) {
        selfie.showWindow(sender)
    }

    @IBAction func showLoggerWindow(_ sender: NSMenuItem) {
        logger.showWindow(sender)
    }

    // MARK: - NSWindowDelegate

    func windowWillClose(_ notification: Notification) {
        log.message("[\(type(of: self))].\(#function)")
        AppGlobals.quitTheApp()
    }
}
