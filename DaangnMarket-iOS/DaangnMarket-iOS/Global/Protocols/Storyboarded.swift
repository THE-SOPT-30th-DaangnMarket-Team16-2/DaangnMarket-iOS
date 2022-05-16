//
//  Storyboarded.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/16.
//

/**

  - Description:
 
          뷰컨트롤러를 편하게 Instantiate하기 위한 프로토콜입니다.
  - 사용법 : VC에 프로토콜을 채택하고 storybaord 프로퍼티를 지정해줍니다.
          
*/

import UIKit

protocol Storyboarded {
    static var storyboard: Storyboards { get }
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let identifier = String(describing: self)
        let uiStoryboard = UIStoryboard(name: self.storyboard.rawValue, bundle: nil)
        guard let vc = uiStoryboard.instantiateViewController(withIdentifier: identifier) as? Self else {
            fatalError("Could not find View Controller named \(identifier)")
        }

        return vc
    }
}

