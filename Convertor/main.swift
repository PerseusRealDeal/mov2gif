//
//  main.swift
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

// MARK: - Log Report

let report = PerseusLogger.Report()
log.customActionOnMessage = report.report(_:_:_:_:_:_:)

// MARK: - Logger

// log.turned = .off
// dmlog.turned = .off

var loadedInfo = ""

if let path = Bundle.main.url(forResource: "CPLConfig", withExtension: "json") {
    if log.loadConfig(path) {
        loadedInfo = "Options successfully loaded!"
    } else {
        loadedInfo = "Failed to load options!"
    }
} else {
    loadedInfo = "Failed to create URL!"
}

log.message(loadedInfo)
log.message("The app's start point...", .info)

// MARK: - Construct the app's top elements

let app = NSApplication.shared

let appPurpose = NSClassFromString("TestingAppDelegate") as? NSObject.Type
let appDelegate = appPurpose?.init() ?? AppDelegate()

let screen = MainWindowController.storyboardInstance()
let mainMenu = NSNib(nibNamed: NSNib.Name("MainMenu"), bundle: nil)

// MARK: - Make the app run

app.setActivationPolicy(.regular)

mainMenu?.instantiate(withOwner: app, topLevelObjects: nil)
screen.window?.makeKeyAndOrderFront(nil)

app.delegate = appDelegate as? NSApplicationDelegate

app.activate(ignoringOtherApps: true)
app.run()
