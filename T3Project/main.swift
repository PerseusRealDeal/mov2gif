//
//  main.swift
//  T3Project
//
//  Created by Mikhail A. Zhigulin of Novosibirsk.
//
//  Unlicensed Free Software.
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

let storyboard = NSStoryboard(name: String(describing: MainWindowController.self), bundle: nil)
let screen = storyboard.instantiateInitialController() as? NSWindowController
let mainMenu = NSNib(nibNamed: NSNib.Name("MainMenu"), bundle: nil)

// MARK: - Make the app run

app.setActivationPolicy(.regular)

mainMenu?.instantiate(withOwner: app, topLevelObjects: nil)
screen?.window?.makeKeyAndOrderFront(nil)

app.delegate = appDelegate as? NSApplicationDelegate

app.activate(ignoringOtherApps: true)
app.run()
