//
//  UIButton+.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/15.
//

import UIKit

extension UIButton {
    
    /// 버튼 Background Color를 상태별로 지정하는 메서드
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        let minimumSize: CGSize = CGSize(width: 1.0, height: 1.0)
        
        UIGraphicsBeginImageContext(minimumSize)
        
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(origin: .zero, size: minimumSize))
        }
        
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.clipsToBounds = true
        self.setBackgroundImage(colorImage, for: state)
    }
    
    /// button의 기본, 클릭 이미지를 빠르게 설정하는 메서드
    func setImgByName(name: String, selectedName: String?) {
        self.setImage(UIImage(named: name), for: .normal)
        if let selected = selectedName {
            self.setImage(UIImage(named: selected), for: .selected)
        }
    }
}


