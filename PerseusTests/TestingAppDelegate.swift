//
//  TestingAppDelegate.swift
//  PerseusTests
//
//  Created by Mikhail A. Zhigulin of Novosibirsk.
//
//  Unlicensed Free Software.
//

import XCTest
@testable import Perseus

// MARK: - The Testing Application Delegate

@objc(TestingAppDelegate)
class TestingAppDelegate: NSResponder, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ aNotification: Notification) {

        var loadedInfo = ""

        if let path = Bundle.main.url(forResource: "CPLConfig", withExtension: "json") {
            let isLoaded = log.loadConfig(path)
            loadedInfo = isLoaded ? "Options successfully loaded!" : "Failed to load options!"
        } else {
            loadedInfo = "Failed to create URL!"
        }

        log.marks = false
        log.message(loadedInfo)

        log.message("The app's test bundle start point...", .info)
        log.message("Launching with testing matter purpose...", .info)

        log.message("[\(type(of: self))].\(#function)")
    }
}
