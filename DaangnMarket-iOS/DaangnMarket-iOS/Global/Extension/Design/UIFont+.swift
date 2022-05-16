//
//  UIFont+.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/15.
//

import UIKit

enum FontWeight {
    case light, regular, medium, bold, semiBold
}

extension UIFont {
    
    // MARK: Pretendard Font
    class func PretendardL(size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-Light", size: size)!
    }
    
    class func PretendardR(size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-Regular", size: size)!
    }
    
    class func PretendardM(size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-Medium", size: size)!
    }
    
    class func PretendardB(size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-Bold", size: size)!
    }
    
    class func PretendardSB(size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-SemiBold", size: size)!
    }
}
