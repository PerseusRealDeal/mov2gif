//
//  MainViewPresenter.swift
//  mov2gif
//
//  Created by Mikhail Zhigulin in 7532 (18.11.2025).
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

// MARK: - MainWindow Communication

protocol MainViewDelegate: MVPViewDelegate {
    func onViewDidAppear()
}

// MARK: - MainWindow Business Logic

class MainViewPresenter: MVPPresenter {

    // MARK: - Initialization

    init(view: MainViewDelegate) {
        super.init(view: view)
    }

    // MARK: - Life Circle

    func viewDidLoad() {

        log.message("[\(type(of: self))].\(#function)")

        view?.setupUI()

        view?.makeUp()
        view?.localize()
    }

    func viewDidAppear() {

        log.message("[\(type(of: self))].\(#function)")

        (view as? MainViewDelegate)?.onViewDidAppear()
    }

    // MARK: - Business Contract

    func forceDarkMode(_ selected: Int) {
        switch selected {
        case 0:
            DarkModeAgent.force(.off)
        case 1:
            DarkModeAgent.force(.on)
        case 2:
            DarkModeAgent.force(.auto)
        default:
            break
        }
    }

    // MARK: - Realization

}
