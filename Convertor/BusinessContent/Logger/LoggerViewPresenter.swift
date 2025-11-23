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

protocol LoggerViewDelegate: MVPViewDelegate {}

// MARK: - LoggerWindow Business Logic

class LoggerViewPresenter: MVPPresenter {

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
    }

    // MARK: - Business Contract
}
