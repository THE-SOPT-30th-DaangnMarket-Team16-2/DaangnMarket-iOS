//
//  Storyboarded.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/16.
//

/**

  - Description:
 
          뷰컨트롤러를 편하게 Instantiate하기 위한 프로토콜입니다.
          
*/

import UIKit

protocol Storyboarded {
    static var storyboard: AppStoryboard { get }
    static func instantiate() -> Self
}

extension Storyboarded {
    static func instantiate() -> Self {
        let identifier = String(describing: self)
        let uiStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let viewController = uiStoryboard.instantiateViewController(withIdentifier: identifier) as! Self

        return viewController
    }
}

