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
    
    enum SectionType: Int {
        case imageSection = 0
        case postSection = 1
    }
    
    private lazy var detailCV: UICollectionView = {
        let layout = createLayout()
        layout.configuration.interSectionSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .carrotButtonOrange
        return cv
    }()
    
    private let pageControl = UIPageControl()
    
    private let bottomView = PostDetailBottomView()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        setDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // MARK: - Bind
    
    // MARK: - Custom Methods
    
    private func setDelegate() {
        detailCV.delegate = self
        detailCV.dataSource = self
        
        detailCV.register(Header.self, forSupplementaryViewOfKind: "header", withReuseIdentifier: "HeaderView")
        PostContentCVC.register(target: detailCV)
    }
    
    // MARK: - UI & Layout
    
    override func configUI() {
        view.backgroundColor = .carrotWhite
    }
    
    override func setLayout() {
        view.addSubviews(detailCV, bottomView)
        
        detailCV.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(bottomView.snp.top)
        }
        
        bottomView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(103)
        }
    }
}

extension PostDetailVC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionType = SectionType(rawValue: section) else { return 1 }
        
        switch sectionType {
        case .imageSection: return 5
        case .postSection: return 1
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == "header" {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath)
            return view
        }
        else { return UICollectionReusableView() }
    }
    
    //셀에 대한 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let postContentCell = collectionView.dequeueReusableCell(withReuseIdentifier: PostContentCVC.className, for: indexPath) as? PostContentCVC else {return UICollectionViewCell() }
        
        return postContentCell
    }
    
    
}
//액션과 관련
extension PostDetailVC: UICollectionViewDelegate {
    
}
