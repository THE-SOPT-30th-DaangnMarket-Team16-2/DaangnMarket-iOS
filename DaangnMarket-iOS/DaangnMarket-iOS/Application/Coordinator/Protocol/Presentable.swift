//
//  Presentable.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/16.
//

import UIKit

protocol Presentable {
  func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
  func toPresent() -> UIViewController? {
    return self
  }
}
