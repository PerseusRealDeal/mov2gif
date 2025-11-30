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

// MARK: - The log report

let report = PerseusLogger.Report()
log.customActionOnMessage = report.report(_:)

// MARK: - The logger

log.message(loadJsonLogProfile("CPLConfig").info)
log.message("The app's start point...", .info)

// MARK: - The app's top elements

let globals = AppGlobals()

let app = NSApplication.shared

let appPurpose = NSClassFromString("TestingAppDelegate") as? NSObject.Type
let appDelegate = appPurpose?.init() ?? AppDelegate()

let screen = MasterWindowController.storyboardInstance()

// MARK: - The app run

app.setActivationPolicy(.regular)
screen.window?.makeKeyAndOrderFront(nil)

app.delegate = appDelegate as? NSApplicationDelegate
app.activate(ignoringOtherApps: true)
app.run()
