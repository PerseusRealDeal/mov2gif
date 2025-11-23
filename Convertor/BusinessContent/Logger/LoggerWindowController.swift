//
//  LoggerWindowController.swift, LoggerWindowController.storyboard
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

extension LoggerWindowController {

    class func storyboardInstance() -> LoggerWindowController {

        let storyboard = NSStoryboard(name: String(describing: self), bundle: nil)
        let screen = storyboard.instantiateInitialController() as? LoggerWindowController

        if let vc = screen?.contentViewController as? LoggerViewController {
            vc.presenter = LoggerViewPresenter(view: vc)
            vc.presenter?.viewDidLoad()
        }

        // Do default setup; don't set any parameter causing loadView up, breaks unit tests

        // screen?.modalTransitionStyle = UIModalTransitionStyle.partialCurl
        // screen?.view.backgroundColor = UIColor.yellow

        return screen ?? LoggerWindowController()
    }
}

class LoggerWindowController: NSWindowController, NSWindowDelegate {

    override func windowDidLoad() {
        super.windowDidLoad()

        log.message("[\(type(of: self))].\(#function)")

        if let window = self.window {
            window.delegate = self
        } else {
            log.message("[\(type(of: self))].\(#function) window instance is nil", .error)
        }
    }

    func windowShouldClose(_ sender: NSWindow) -> Bool {

        log.message("[\(type(of: self))].\(#function)")
        self.window?.orderOut(sender)

        return false
    }
}
