//
//  UIViewController+.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/15.
//

import UIKit

extension UIViewController {
    
    /**
     - Description: 화면 터치시 작성 종료
     */
    /// 화면 터치시 작성 종료하는 메서드
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /**
     - Description: 화면 터치시 키보드 내리는 Extension
     */
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }

    /**
     - Description: Alert
     */
    /// 확인 버튼 2개, 취소 버튼 1개 ActionSheet 메서드
    func makeTwoAlertWithCancel(okTitle: String, okStyle: UIAlertAction.Style = .default,
                                secondOkTitle: String, secondOkStyle: UIAlertAction.Style = .default,
                                cancelTitle: String = "취소",
                                okAction : ((UIAlertAction) -> Void)?, secondOkAction : ((UIAlertAction) -> Void)?, cancelAction : ((UIAlertAction) -> Void)? = nil,
                                completion : (() -> Void)? = nil) {
        
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
        let alertViewController = UIAlertController(title: nil, message: nil,
                                                    preferredStyle: .actionSheet)
        
        let okAction = UIAlertAction(title: okTitle, style: okStyle, handler: okAction)
        alertViewController.addAction(okAction)
        
        let secondOkAction = UIAlertAction(title: secondOkTitle, style: secondOkStyle, handler: secondOkAction)
        alertViewController.addAction(secondOkAction)
        
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelAction)
        alertViewController.addAction(cancelAction)
        
        self.present(alertViewController, animated: true, completion: completion)
    }
    
    /// 확인 버튼 1개, 취소 버튼 1개 Alert 메서드
    func makeAlertWithCancel(okTitle: String, okStyle: UIAlertAction.Style = .default,
                             cancelTitle: String = "취소",
                             okAction : ((UIAlertAction) -> Void)?, cancelAction : ((UIAlertAction) -> Void)? = nil,
                             completion : (() -> Void)? = nil) {
        
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
        let alertViewController = UIAlertController(title: nil, message: nil,
                                                    preferredStyle: .actionSheet)
        
        let okAction = UIAlertAction(title: okTitle, style: okStyle, handler: okAction)
        alertViewController.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelAction)
        alertViewController.addAction(cancelAction)
        
        self.present(alertViewController, animated: true, completion: completion)
    }
    
}

