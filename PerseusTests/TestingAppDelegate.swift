//
//  TestingAppDelegate.swift
//  PerseusTests
//
//  Created by Mikhail A. Zhigulin of Novosibirsk.
//
//  Unlicensed Free Software.
//

import XCTest
@testable import mov2gif

// MARK: - The Testing Application Delegate

@objc(TestingAppDelegate)
class TestingAppDelegate: NSResponder, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ aNotification: Notification) {

        log.output = .standard
        log.time = true

        log.message("The app's test bundle start point...", .info)
        log.message("Launching with testing matter purpose...", .info)

        log.message("[\(type(of: self))].\(#function)")
    }
}
