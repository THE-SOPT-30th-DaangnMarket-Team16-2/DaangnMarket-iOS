//
//  PostDetailVC2.swift
//  DaangnMarket-iOS
//
//  Created by subinyoon on 2022/05/25.
//

import UIKit

final class PostDetailVC2: UIViewController, Storyboarded {

    // MARK: - Properties
    static var storyboard: Storyboards = .postDetail2
    var detailModel: PostDetail?
    
    var postId: String?
    
    private lazy var naviHomeButton: UIButton =  {
        let bt = UIButton()
        bt.setImage(ImageLiterals.PostDetail.homeIcon, for: .normal)
        bt.addAction(UIAction(handler: { _ in
            self.navigationController?.popViewController(animated: true)
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

    @IBOutlet weak var photoScrollView: UIScrollView!
    @IBOutlet weak var photoPageControl: UIPageControl!
    
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var stateButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var contextLabel: UILabel!
    
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceOfferLabel: UILabel!
    
    var images = [UIImage(named: "postDetail_1"),
                  UIImage(named: "postDetail_2"),
                  UIImage(named: "postDetail_3"),
                  UIImage(named: "postDetail_4"),
                  UIImage(named: "postDetail_5")]
    var imageViews = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoScrollView.delegate = self
        addContentScrollView()
        setPageControl()
        configUI()
        navigationBarUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func stateButtonTapped(_ sender: Any) {
        
        let actionSheet = UIAlertController(title: "상태 변경", message: nil, preferredStyle: .actionSheet)

        let sellingAction = UIAlertAction(title: "판매중", style: .default) { _ in
            self.stateButton.titleLabel?.text = "판매중"
        }
        let reservedAction = UIAlertAction(title: "예약중", style: .default) { _ in
            self.stateButton.titleLabel?.text = "예약중"
        }
        let completedAction = UIAlertAction(title: "판매완료", style: .default) { _ in
            self.stateButton.titleLabel?.text = "판매완료"
        }
        let cancelAction = UIAlertAction(title: "닫기", style: .cancel, handler: nil)

        actionSheet.addAction(sellingAction)
        actionSheet.addAction(reservedAction)
        actionSheet.addAction(completedAction)
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true)

    }
    
    @IBAction func heartBtnTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        changeLikesStatus()
    }
    
    private func configUI() {
        self.stateButton.titleLabel?.text = "판매중"
        guard let detailModel = detailModel else { return }
        let strPrice = numberFormatter(number: Int(detailModel.price)!)
        
        userNameLabel.text = detailModel.user.name
        titleLabel.text = detailModel.title
        categoryLabel.text = detailModel.category
        contextLabel.text = detailModel.content
        priceLabel.text = strPrice + "원"
        priceOfferLabel.text = detailModel.isPriceSuggestion
    }
    
    private func navigationBarUI() {
        let homeBtn = UIBarButtonItem(customView: naviHomeButton)
        let moreBtn = UIBarButtonItem(customView: naviMoreButton)
        
        self.navigationItem.setLeftBarButton(homeBtn, animated: false)
        self.navigationItem.setRightBarButton(moreBtn, animated: false)
    }
    
    private func numberFormatter(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: number))!
    }
}

extension PostDetailVC2: UIScrollViewDelegate {
    private func addContentScrollView() {
        
        for i in 0..<images.count {
            let imageView = UIImageView()
            let xPos = self.view.frame.width * CGFloat(i)
            
            imageView.frame = CGRect(x: xPos, y: 0, width: self.view.frame.width, height: photoScrollView.bounds.height)
            imageView.image = images[i]
            photoScrollView.addSubview(imageView)
            photoScrollView.contentSize = CGSize(width: imageView.frame.width * CGFloat(images.count) , height: imageView.frame.height)
        }
        
    }
    
    private func setPageControl() {
        photoPageControl.numberOfPages = images.count
        self.view.bringSubviewToFront(photoPageControl)
        
    }
    
    private func setPageControlSelectedPage(currentPage:Int) {
        photoPageControl.currentPage = currentPage
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x/scrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }
}

extension PostDetailVC2 {
    
    func changeLikesStatus() {
        HomeService.shared.changeLikeStatus(postId: postId ?? "") { networkResult in
            switch networkResult {
            case .success(let message):
                print(message)
            default:
                break;
            }
        }
    }
}
