//
//  TheMenu.swift, MainMenu.xib
//  T3Project
//
//  Created by Mikhail A. Zhigulin of Novosibirsk.
//
//  Unlicensed Free Software.
//

import Cocoa

class TheMenu: NSMenu {

    @IBOutlet private weak var settingsMenuItem: NSMenuItem! {
        didSet {
            settingsMenuItem.title = AppGlobals.SystemServices.title.localizedValue
        }
    }
}
