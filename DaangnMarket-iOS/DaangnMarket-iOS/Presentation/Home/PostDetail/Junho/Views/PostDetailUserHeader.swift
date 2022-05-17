//
//  PostDetailUserHeader.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/18.
//

import UIKit

final class Header: UICollectionReusableView {

    let label = UILabel()
    private let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.text = "Categories"
        addSubview(stackView)
        stackView.addArrangedSubview(label)
        let button = UIButton(type: .system)
        button.setTitle("더보기", for: .normal)
        button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        stackView.addArrangedSubview(button)
        self.backgroundColor = .carrotBlue
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
