//
//  Coordinator.swift
//  mov2gif
//
//  Created by Mikhail Zhigulin in 7534 (30.12.2025.)
//
//  Copyright © 7534 Mikhail Zhigulin of Novosibirsk
//  Copyright © 7534 PerseusRealDeal
//
//  The year starts from the creation of the world in the Star temple
//  according to a Slavic calendar. September, the 1st of Slavic year.
//
//  See LICENSE for details. All rights reserved.
//

import Foundation

class Coordinator {

    // MARK: - Screens

    lazy var screenMaster = { () -> MasterWindowController in
        return MasterWindowController.storyboardInstance()
    }()

    lazy var screenSelfie = { () -> SelfieWindowController in
        return SelfieWindowController.storyboardInstance()
    }()

    lazy var screenLogger = { () -> LoggerWindowController in
        return LoggerWindowController.storyboardInstance()
    }()

    // MARK: - Singletone

    static let shared = Coordinator()

    // MARK: - Initialization

    init() {
        log.message("[\(type(of: self))].\(#function)")
    }

    // MARK: - Contract

    static func start() {
        log.message("[\(type(of: self))].\(#function)")
    }

    static func masterWindowToFront() {
        shared.screenMaster.window?.makeKeyAndOrderFront(nil)
    }
}
