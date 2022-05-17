//
//  PostDetailVC.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/16.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

final class PostDetailVC: BaseVC, Storyboarded {
    
    // MARK: - Properties
    
    static var storyboard: Storyboards = .postDetail
    
    private let bottomView = PostDetailBottomView()
    
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // MARK: - Bind
    
    // MARK: - Custom Methods
    
    
    // MARK: - UI & Layout
    
    override func configUI() {
        view.backgroundColor = .carrotWhite
    }
    
    override func setLayout() {
        view.addSubviews(bottomView)
        
        bottomView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(103)
        }
    }
}

