//
//  UIView+.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/15.
//

import UIKit

extension UIView {
    
    // UIView 여러 개 인자로 받아서 한 번에 addSubview
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
