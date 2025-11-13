//
//  LocalizationExtentions.swift
//  Gifts
//
//  Just a gift. Tested with Swift 4.2 compiler.
//

import Foundation

extension String {
    var localizedValue: String { return NSLocalizedString(self, comment: "") }
}
