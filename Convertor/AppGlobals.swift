//
//  AppGlobals.swift
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

var isHighSierra: Bool { // true HighSierra, false otherwise
    if #available(macOS 10.14, *) {
        return false
    } // For HighSierra.
    return true
}

struct AppGlobals {

    // MARK: - Constants

    static var SystemServices: (appName: String, title: String) {

        var calculated: (String, String)?

        if #available(macOS 10.14, *) {
            calculated = ("System Settings.app", "Settings...")
        } else {
            calculated = ("System Preferences.app", "Preferences...")
        }

        return calculated!
    }

    // MARK: - System Services

    static let ud = UserDefaults.standard
    static let nc = NotificationCenter.default

    // MARK: - Custom Services

    public let languageSwitcher: LanguageSwitcher

    // MARK: - Init

    init() {
        log.message("[AppGlobals].\(#function)")

        // Init custom services here.

        self.languageSwitcher = LanguageSwitcher.shared
    }

    // MARK: - Common system relative functions

    static func clickWebLink(string link: String) {

        log.message("[\(type(of: self))].\(#function)")

        guard let url = NSURL(string: link) as URL? else {
            log.message("[\(type(of: self))].\(#function)", .error)
            return
        }

        _ = NSWorkspace.shared.open(url) ?
            log.message("[\(type(of: self))].\(#function) - Web browser opened.") :
            log.message("[\(type(of: self))].\(#function) - Web browser not opened.")
    }

    static func makeTheAppRun(_ name: String?) {

        /* One way to open System options app */

        let mger = FileManager.default

        guard
            let theAppName = name,
            let pathFirst = mger.urls(for: .applicationDirectory, in: .systemDomainMask).first
        else {
            return
        }

        /* Another way to open System options app */
        // guard let pathURL = URL(string: AppGlobals.openSystemApp) else { return }

        NSWorkspace.shared.open(pathFirst.appendingPathComponent(theAppName))
    }

    static func quitTheApp() {
        log.message("[\(type(of: self))].\(#function)", .info)

        // Instructions before quit.

        app.terminate(appDelegate)
    }

    static func openDefaultBrowser(string link: String) {

        log.message("[\(type(of: self))].\(#function)")

        guard let url = NSURL(string: link) as URL? else {
            log.message("[\(type(of: self))].\(#function)", .error)
            return
        }

        _ = NSWorkspace.shared.open(url) ?
        log.message("[\(type(of: self))].\(#function) Default browser opened.") :
        log.message("[\(type(of: self))].\(#function) Default browser not opened.")
    }
}

func loadCPLProfile(_ name: String) -> (status: Bool, info: String) {
    if let path = Bundle.main.url(forResource: name, withExtension: "json") {
        if log.loadConfig(path) {
            return (true, "Options successfully reseted.")
        } else {
            return (false, "Failed to reset options.")
        }
    } else {
        return (false, "Failed to create URL.")
    }
}
