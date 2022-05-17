//
//  PostDetailBottomView.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/17.
//

import UIKit

import SnapKit

final class PostDetailBottomView: UIView {
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .carrotLineLightGray
        return view
    }()
    
    private lazy var likeButton: UIButton = {
        let bt = UIButton()
        bt.setImage(ImageLiterals.MainTabBar.homeIcon, for: .normal)
        bt.setImage(ImageLiterals.MainTabBar.homeIcon, for: .selected)
        bt.setTitleColor(UIColor.carrotWhite, for: .normal)
        return bt
    }()
    
    private let verticalLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .carrotLineLightGray
        return view
    }()
    
    private let priceLabel: UILabel = {
        let lb = UILabel()
        lb.text = "16,000원"
        lb.textColor = .carrotBlack
        lb.font = .PopBold(size: 16)
        return lb
    }()
    
    private let guideLabel: UILabel = {
        let lb = UILabel()
        lb.text = "가격제안불가"
        lb.textColor = .carrotDarkLightGray
        lb.font = .NotoBold(size: 13)
        return lb
    }()
    
    private lazy var chatButton: UIButton = {
        let bt = UIButton()
        bt.backgroundColor = .carrotButtonOrange
        bt.titleLabel?.font = .NotoBold(size: 15)
        bt.setTitle("채팅 목록 보기", for: .normal)
        bt.setTitleColor(UIColor.carrotWhite, for: .normal)
        bt.layer.cornerRadius = 5
        return bt
    }()
    
    // MARK: View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    // MARK: - UI & Layout
    
    private func setUI() {
        self.backgroundColor = .carrotWhite
    }
    
    private func setLayout() {
        self.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(102)
        }
        
        self.addSubviews(lineView, likeButton, verticalLineView,
                         priceLabel, guideLabel, chatButton)
        
        lineView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1)
        }
        
        likeButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(29)
        }
        
        verticalLineView.snp.makeConstraints { make in
            make.centerY.equalTo(likeButton.snp.centerY)
            make.leading.equalTo(likeButton.snp.trailing).offset(16)
            make.width.equalTo(1)
            make.height.equalTo(40)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.leading.equalTo(verticalLineView.snp.trailing).offset(18)
            make.top.equalTo(lineView.snp.bottom).offset(20)
        }
        
        guideLabel.snp.makeConstraints { make in
            make.leading.equalTo(verticalLineView.snp.trailing).offset(18)
            make.top.equalTo(priceLabel.snp.bottom).offset(3)
        }
        
        chatButton.snp.makeConstraints { make in
            make.centerY.equalTo(likeButton.snp.centerY)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(41)
            make.width.equalTo(122)
        }
    }
}
