//
//  MasterWindowController.swift, MasterWindowController.storyboard
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

extension MasterWindowController {

    class func storyboardInstance() -> MasterWindowController {

        let storyboard = NSStoryboard(name: String(describing: self), bundle: nil)
        let screen = storyboard.instantiateInitialController() as? MasterWindowController

        if let vc = screen?.contentViewController as? MasterViewController {
            vc.presenter = MasterViewPresenter(view: vc)
            vc.presenter?.viewDidLoad()
        }

        // Do default setup; don't set any parameter causing loadView up, breaks unit tests

        // screen?.modalTransitionStyle = UIModalTransitionStyle.partialCurl
        // screen?.view.backgroundColor = UIColor.yellow

        return screen ?? MasterWindowController()
    }
}

class MasterWindowController: NSWindowController, NSWindowDelegate {

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
        Coordinator.shared.screenSelfie.showWindow(sender)
    }

    @IBAction func showLoggerWindow(_ sender: NSMenuItem) {
        Coordinator.shared.screenLogger.showWindow(sender)
    }

    // MARK: - NSWindowDelegate

    func windowWillClose(_ notification: Notification) {
        log.message("[\(type(of: self))].\(#function)")
        AppGlobals.quitTheApp()
    }
}
