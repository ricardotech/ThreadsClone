//
//  UIUtils.swift
//  Threads
//
//  Created by Ricardo Fonseca on 10/12/23.
//

import SwiftUI

struct UIUtils {
    static func buttonForegroundColor(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .dark ? .black : .white
    }
    
    static func buttonBackgroundColor(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .dark ? .white : .black
    }
    
    static func textForegroundColor(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .dark ? .white : .black
    }
}
