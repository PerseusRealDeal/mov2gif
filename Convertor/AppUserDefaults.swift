//
//  AppUserDefaults.swift
//  mov2gif
//
//  Created by Mikhail Zhigulin in 7534 (21.11.2025).
//
//  INFO: Origionally from my "The Dark Moon" open-source project.
//  https://github.com/PerseusRealDeal/TheDarkMoon
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

// MARK: - Keys

public let LANGUAGE_OPTION_KEY = "LANGUAGE_OPTION_KEY"
public let LANGUAGE_OPTION_DEFAULT = LanguageOption.system

// MARK: - User Defaults

class AppOptions {

    // MARK: - Language Option

    public static var languageOption: LanguageOption {
        get {
            // Load enum Int value

            let ud = AppGlobals.ud

            let rawValue = ud.valueExists(forKey: LANGUAGE_OPTION_KEY) ?
                ud.integer(forKey: LANGUAGE_OPTION_KEY) : LANGUAGE_OPTION_DEFAULT.rawValue

            // Try to cast Int value to enum

            if let result = LanguageOption.init(rawValue: rawValue) { return result }

            // Return default saved value in any other case

            ud.setValue(LANGUAGE_OPTION_DEFAULT.rawValue, forKey: LANGUAGE_OPTION_KEY)
            return LANGUAGE_OPTION_DEFAULT
        }
        set {
            AppGlobals.ud.setValue(newValue.rawValue, forKey: LANGUAGE_OPTION_KEY)
        }
    }
}
