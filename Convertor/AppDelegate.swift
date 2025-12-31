//
//  AppDelegate.swift
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

class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        log.message("[\(type(of: self))].\(#function)")

        LanguageSwitcher.switchLanguageIfNeeded(AppOptions.languageOption)
        DarkModeAgent.force(DarkModeUserChoice)

        log.message("Started with business matter purpose...", .info)
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {

        log.message("[\(type(of: self))].\(#function)", .info)

        NSApplication.shared.terminate(self)
        return true
    }
}
