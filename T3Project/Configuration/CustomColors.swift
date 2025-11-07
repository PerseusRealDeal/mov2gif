//
//  CustomColors.swift
//  T3Project
//
//  Created by Mikhail A. Zhigulin of Novosibirsk.
//
//  Unlicensed Free Software.
//

import AppKit

public protocol CustomColorsProtocol {
    static var labelCustomColor: NSColor { get }
}

extension NSColor: CustomColorsProtocol {
    public static var labelCustomColor: NSColor {
        return DarkModeAgent.shared.style == .light ?
            rgba255(255, 255, 255, 0.9) : rgba255(235, 235, 245, 0.6)
    }
}
