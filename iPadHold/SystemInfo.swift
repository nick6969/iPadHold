//
//  SystemInfo.swift
//  iPadHold
//
//  Created by CHIH HAO LIN on 2022/2/17.
//

import UIKit

enum SystemInfo {
    
    static var isPortrait: Bool {
        UIDevice.current.orientation.isValidInterfaceOrientation
            ? deviceIsPortrait
            : windowIsPortrait
    }

    private static var deviceIsPortrait: Bool {
        UIDevice.current.orientation.isPortrait
    }

    private static var windowIsPortrait: Bool {
        UIApplication.shared.windows
            .first?
            .windowScene?
            .interfaceOrientation
            .isPortrait ?? false
    }

}
