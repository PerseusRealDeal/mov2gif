//
//  LoggerViewPresenter.swift
//  mov2gif
//
//  Created by Perseus on 23.11.2025.
//  Copyright © 2025 Mikhail Zhigulin. All rights reserved.
//

import Foundation

// MARK: - SelfieWindow Communication

protocol LoggerViewDelegate: MVPViewDelegate {}

// MARK: - SelfieWindow Business Logic

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
