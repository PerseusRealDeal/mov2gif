//
//  SelfieViewController.swift, SelfieWindowController.storyboard
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

extension SelfieWindowController {

    class func storyboardInstance() -> SelfieWindowController {

        let storyboard = NSStoryboard(name: String(describing: self), bundle: nil)
        let screen = storyboard.instantiateInitialController() as? SelfieWindowController

        if let vc = screen?.contentViewController as? SelfieViewController {
            vc.presenter = SelfieViewPresenter(view: vc)
            vc.presenter?.viewDidLoad()
        }

        // Do default setup; don't set any parameter causing loadView up, breaks unit tests

        // screen?.modalTransitionStyle = UIModalTransitionStyle.partialCurl
        // screen?.view.backgroundColor = UIColor.yellow

        return screen ?? SelfieWindowController()
    }
}

class SelfieWindowController: NSWindowController, NSWindowDelegate {

    override func windowDidLoad() {
        super.windowDidLoad()

        // window?.appearance = NSAppearance(named: NSAppearance.Name.vibrantDark)
        self.window?.title = AppGlobals.SystemServices.title
    }

    func windowShouldClose(_ sender: NSWindow) -> Bool {
        self.window?.orderOut(sender)
        return false
    }
}
