//
//  LoggerViewPresenter.swift
//  mov2gif
//
//  Created by Mikhail Zhigulin in 7534 (23.11.2025).
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

// MARK: - LoggerWindow Communication

protocol LoggerViewDelegate: MVPViewDelegate {
    func onViewDidAppear()
    func refreshMessages()
    func clear()
}

// MARK: - LoggerWindow Business Logic

class LoggerViewPresenter: MVPPresenter {

    private var reportObservation: NSKeyValueObservation?

    // MARK: - Initialization

    init(view: LoggerViewDelegate) {
        super.init(view: view)
    }

    // MARK: - Life Circle

    func viewDidLoad() {

        log.message("[\(type(of: self))].\(#function)")

        view?.setupUI()

        view?.makeUp()
        view?.localize()

        reportObservation = report.observe(\.lastMessage, options: .new) { _, _ in
            (self.view as? LoggerViewDelegate)?.refreshMessages()
        }
    }

    func viewDidAppear() {

        log.message("[\(type(of: self))].\(#function)")

        (view as? LoggerViewDelegate)?.onViewDidAppear()
    }

    // MARK: - Business Contract

    func forceTurned(_ turned: Bool) {

        log.message("[\(type(of: self))].\(#function)")
        log.turned = turned == true ? .on : .off

        if log.turned == .off {
            report.clear()
            (view as? LoggerViewDelegate)?.clear()
        }
    }

    func forceOutput(_ selected: Int) {

        log.message("[\(type(of: self))].\(#function)")
        switch selected {
        case 0:
            log.output = .standard
        case 1:
            log.output = .consoleapp
        case 2:
            log.output = .custom
        default:
            return
        }
    }

    func forceFormat(_ stringFormat: String) {

        log.message("[\(type(of: self))].\(#function)")
        guard let item = PerseusLogger.MessageFormat(rawValue: stringFormat)
        else {
            log.message("[\(type(of: self))].\(#function)", .error)
            return
        }

        log.format = item
        log.message("[\(type(of: self))].\(#function) \(log.format)")
    }

    func forceLevel(_ number: Int) {

        log.message("[\(type(of: self))].\(#function)")
        guard let item = PerseusLogger.Level(rawValue: abs(number - 5))
        else {
            log.message("[\(type(of: self))].\(#function)", .error)
            return
        }

        log.level = item
    }
}
