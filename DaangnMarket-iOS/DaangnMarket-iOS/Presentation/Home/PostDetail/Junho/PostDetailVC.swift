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
        cv.backgroundColor = .carrotWhite
        return cv
    }()
    
    internal let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = 5
        pc.pageIndicatorTintColor = .carrotDarkLightGray
        pc.currentPageIndicatorTintColor = .carrotWhite
        return pc
    }()
    
    private lazy var naviHomeButton: UIButton =  {
        let bt = UIButton()
        bt.setImage(ImageLiterals.PostDetail.homeIcon, for: .normal)
        bt.addAction(UIAction(handler: { _ in
            
        }), for: .touchUpInside)
        bt.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        return bt
    }()
    
    private lazy var naviMoreButton: UIButton =  {
        let bt = UIButton()
        bt.setImage(ImageLiterals.PostDetail.moreIcon, for: .normal)
        bt.addAction(UIAction(handler: { _ in
            
        }), for: .touchUpInside)
        bt.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        return bt
    }()
    
    private let bottomView = PostDetailBottomView()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        setDelegate()
        setCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // MARK: - Bind
    
    // MARK: - Custom Methods
    
    private func setDelegate() {
        detailCV.delegate = self
        detailCV.dataSource = self
        
        
    }
    
    private func setCollectionView() {
        detailCV.register(PostDetailUserHeader.self, forSupplementaryViewOfKind: PostDetailUserHeader.className, withReuseIdentifier: PostDetailUserHeader.className)
        
        PostImageCVC.register(target: detailCV)
        PostContentCVC.register(target: detailCV)
    }
    
    // MARK: - UI & Layout
    
    override func configUI() {
        view.backgroundColor = .carrotWhite
        
        let homeBtn = UIBarButtonItem(customView: naviHomeButton)
        let moreBtn = UIBarButtonItem(customView: naviMoreButton)
        self.navigationItem.setLeftBarButton(homeBtn, animated: false)
        self.navigationItem.setRightBarButton(moreBtn, animated: false)
    }
    
    override func setLayout() {
        view.addSubviews(detailCV, pageControl, bottomView)
        
        detailCV.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(bottomView.snp.top)
        }
        
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(UIScreen.main.bounds.width-23)
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
        if kind == PostDetailUserHeader.className {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PostDetailUserHeader.className, for: indexPath)
            return view
        }
        else { return UICollectionReusableView() }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let sectionType = SectionType(rawValue: indexPath.section) else { return UICollectionViewCell() }
        
        switch sectionType {
        case .imageSection:
            guard let postImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: PostImageCVC.className, for: indexPath) as? PostImageCVC else { return UICollectionViewCell() }
            
            return postImageCell
        case .postSection:
            guard let postContentCell = collectionView.dequeueReusableCell(withReuseIdentifier: PostContentCVC.className, for: indexPath) as? PostContentCVC else { return UICollectionViewCell() }
            
            return postContentCell
        }
    }
}

extension PostDetailVC: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.pageControl.snp.remakeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(-scrollView.contentOffset.y+UIScreen.main.bounds.width-40)
        }
    }
}
