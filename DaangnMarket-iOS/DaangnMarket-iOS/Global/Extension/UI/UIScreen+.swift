//
//  UIScreen+.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/16.
//

import UIKit

extension UIScreen {
    public var hasNotch: Bool {
        let deviceRatio = UIScreen.main.bounds.width / UIScreen.main.bounds.height
        if deviceRatio > 0.5 {
            return false
        } else {
            return true
        }
    }
}
