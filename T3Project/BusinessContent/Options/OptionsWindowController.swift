//
//  OptionsWindowController.swift, OptionsWindowController.storyboard
//  T3Project
//
//  Created by Mikhail A. Zhigulin of Novosibirsk.
//
//  Unlicensed Free Software.
//

import Cocoa

class OptionsWindowController: NSWindowController, NSWindowDelegate {

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
