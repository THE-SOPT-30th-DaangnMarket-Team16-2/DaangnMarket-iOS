//
//  PostDetailBottomSheet.swift
//  DaangnMarket-iOS
//
//  Created by subinyoon on 2022/05/25.
//

import UIKit

class PostDetailBottomSheet: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let touch = touches.first,
           touch.view == self.view {
            hideBottomSheetWithAnimation()
        }
    }
    
    private func setUI() {
        containerHeight.constant = 0
        containerView.layer.cornerRadius = 15
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    @IBAction func saleBtnDidTap(_ sender: Any) {
        
    }
    
    @IBAction func reservedBtnDidTap(_ sender: Any) {
        
    }
    
    @IBAction func soldoutBtnDidTap(_ sender: Any) {
        
    }
    
    @IBAction func cancelBtnTapped(_ sender: Any) {
        hideBottomSheetWithAnimation()
    }
    
}

// MARK: - Show/Hide Animation
extension PostDetailBottomSheet {
    func showBottomSheetWithAnimation() {
        UIView.animate(withDuration: 0.1) {
            self.containerHeight.constant = 200
            self.view.layoutIfNeeded()
        }
    }
    
    func hideBottomSheetWithAnimation() {
        UIView.animate(withDuration: 0.1) {
            self.containerHeight.constant = 0
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.dismiss(animated: false)
        }
    }
}


