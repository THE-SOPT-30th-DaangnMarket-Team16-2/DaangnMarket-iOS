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
    var images = [String]()
    var imageCount: Int = 0
    var fromPostWrite: Bool = false
    
    // MARK: - UI Component Part
    @IBOutlet weak var photoScrollView: UIScrollView!
    @IBOutlet weak var photoPageControl: UIPageControl!
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var stateButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var contextLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceOfferLabel: UILabel!
    
    // MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        configUI()
        navigationBarUI()
        setButtonUI()
        fromPostDetail()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigationBar()
    }
    
    // MARK: - IBAction Part
    @IBAction func stateButtonTapped(_ sender: Any) {
        stateActionSheet()
    }
    
    @IBAction func heartBtnTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        changeLikesStatus()
    }
    
    // MARK: - Custom Method Part
    private func setDelegate() {
        photoScrollView.delegate = self
    }
    
    private func setButtonUI() {
        self.stateButton.titleLabel?.text = "판매중"
    }
    
    private func configUI() {
        
        guard let detailModel = detailModel else { return }
        let strPrice = numberFormatter(number: Int(exactly: detailModel.price)!)
        
        if !fromPostWrite {
            images = detailModel.image
        } else {
            for _ in 0..<imageCount {
                images.append(detailModel.image[0])
            }
        }
        setPageControl()
        addContentScrollView()

        userNameLabel.text = detailModel.user.name
        locationLabel.text = detailModel.user.region
        //        userProfileImage.setImage(with: detailModel.user.profile)
        titleLabel.text = detailModel.title
        categoryLabel.text = detailModel.category
        createdAtLabel.text = detailModel.createdAt
        contextLabel.text = detailModel.title
        priceLabel.text = strPrice + "원"
        priceOfferLabel.text = detailModel.isPriceSuggestion ? "가격제안 가능" : "가격제안 불가"
        heartButton.isSelected = detailModel.isLiked
        switch detailModel.onSale {
        case "0":
            self.stateButton.titleLabel?.text = "판매중"
        case "1":
            self.stateButton.titleLabel?.text = "예약중"
        case "2":
            self.stateButton.titleLabel?.text = "판매완료"
        default:
            break
        }
    }
    
    private func fromPostDetail() {
        if let _ = postId, !fromPostWrite {
            getPostDetail()
        }
    }
    
    private func setNavigationBar() {
        navigationController?.isNavigationBarHidden = false
    }
    
    private func navigationBarUI() {
        let naviHomeButton: UIButton =  {
            let bt = UIButton()
            bt.setImage(ImageLiterals.PostDetail.homeIcon, for: .normal)
            bt.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
            bt.addAction(UIAction(handler: { _ in
                self.navigationController?.popViewController(animated: true)
            }), for: .touchUpInside)
            return bt
        }()
        
        let naviMoreButton: UIButton =  {
            let bt = UIButton()
            bt.setImage(ImageLiterals.PostDetail.moreIcon, for: .normal)
            bt.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
            
            return bt
        }()
        
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
    
    private func stateActionSheet() {
        let actionSheet = UIAlertController(title: "상태 변경", message: nil, preferredStyle: .actionSheet)
        
        let sellingAction = UIAlertAction(title: "판매중", style: .default) { _ in
            self.stateButton.titleLabel?.text = "판매중"
            self.changeSellStatus(onSale: "0")
        }
        let reservedAction = UIAlertAction(title: "예약중", style: .default) { _ in
            self.stateButton.titleLabel?.text = "예약중"
            self.changeSellStatus(onSale: "1")
        }
        let completedAction = UIAlertAction(title: "판매완료", style: .default) { _ in
            self.stateButton.titleLabel?.text = "판매완료"
            self.changeSellStatus(onSale: "2")
        }
        let cancelAction = UIAlertAction(title: "닫기", style: .cancel, handler: nil)
        
        actionSheet.addAction(sellingAction)
        actionSheet.addAction(reservedAction)
        actionSheet.addAction(completedAction)
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true)
    }
}

// MARK: - UIScrollViewDelegate
extension PostDetailVC2: UIScrollViewDelegate {
    private func addContentScrollView() {
        for i in 0..<images.count {
            let imageView = UIImageView()
            let xPos = self.view.frame.width * CGFloat(i)
            
            imageView.frame = CGRect(x: xPos, y: 0, width: self.view.frame.width, height: photoScrollView.bounds.height)
            imageView.setImage(with: images[i])
            
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

// MARK: - NETWORK
extension PostDetailVC2 {
    func getPostDetail() {
        HomeService.shared.getPostDetail(postId: postId ?? "") { networkResult in
            switch networkResult {
            case .success(let data):
                if let data = data as? PostDetail {
                    self.detailModel = data
                    self.configUI()
                }
            default:
                break
            }
        }
    }
    
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
    
    func changeSellStatus(onSale: String) {
        HomeService.shared.changeSellStatus(postId: postId ?? "", onSale: onSale) { networkResult in
            switch networkResult {
            case .success(let message):
                print(message)
            default:
                break;
            }
        }
    }
}
