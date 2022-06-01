//
//  PostWriteVC.swift
//  DaangnMarket-iOS
//
//  Created by subinyoon on 2022/05/18.
//

import UIKit

final class PostWriteVC: UIViewController, Storyboarded {
    
    // MARK: - Properties
    static var storyboard: Storyboards = .postWrite
    private var photoModel: PhotoDataModel = PhotoDataModel()
    
    // MARK: - UI Component Part
    @IBOutlet weak var writeScrollView: UIScrollView!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var wonLabel: UILabel!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var priceOfferButton: UIButton! {
        didSet {
            priceOfferButton.isEnabled = false
        }
    }
    @IBOutlet weak var priceOfferLabel: UILabel!
    @IBOutlet weak var contextTextView: UITextView!
    @IBOutlet weak var bottomView: UIView!
    
    private lazy var naviCompleteButton: UIButton =  {
        let bt = UIButton()
        bt.setTitleColor(UIColor.carrotTextOrange, for: .normal)
        bt.setTitle("완료", for: .normal)
        bt.titleLabel?.font = .NotoRegular(size: 17)
        bt.addAction(UIAction(handler: { _ in
            self.createPostWrite()
          }), for: .touchUpInside)
        bt.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        return bt
    }()
    
    private lazy var naviBackButton: UIButton =  {
        let bt = UIButton()
        bt.setTitleColor(UIColor.carrotDeepGray, for: .normal)
        bt.setTitle("닫기", for: .normal)
        bt.titleLabel?.font = .NotoRegular(size: 17)
        bt.addAction(UIAction(handler: { _ in
            self.navigationController?.popViewController(animated: true)
        }), for: .touchUpInside)
        bt.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        return bt
    }()
    
    // MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addKeyboardObserver()
        setNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeKeyboardObserver()
    }
    
    // MARK: - IBAction Part
    @IBAction func priceEditingChanged(_ sender: UITextField) {
        
        checkMaxLength(priceTextField, 11) /// 999,999,999
        priceOfferButton.isEnabled = priceTextField.hasText
        
        if sender.text?.isEmpty == true {
            wonLabel.textColor = UIColor.carrotSquareGray
            priceOfferLabel.textColor = UIColor.carrotSquareGray
            priceOfferButton.isEnabled = false
        } else {
            guard let optionalPrice = priceTextField.text?.replacingOccurrences(of: ",", with: "") else { return }
            priceTextField.text = numberFormatter(number: Int(optionalPrice)!)
            wonLabel.textColor = UIColor.carrotBlack
            priceOfferLabel.textColor = UIColor.carrotBlack
            priceOfferButton.setImage(UIImage(named: "icn_check_after"), for: .normal)
        }
    }
    
    @IBAction func offerBtnDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    // MARK: - Custom Method Part
    private func numberFormatter(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: number))!
    }
    
    private func setDelegate() {
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        priceTextField.delegate = self
        contextTextView.delegate = self
    }
    
    private func configUI() {
        let completeBtn = UIBarButtonItem(customView: naviCompleteButton)
        let backBtn = UIBarButtonItem(customView: naviBackButton)
        
        self.navigationItem.title = "중고거래 글쓰기"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.carrotBlack,
                                                                        NSAttributedString.Key.font : UIFont.NotoBold(size: 16)]
        
        self.navigationItem.setRightBarButton(completeBtn, animated: false)
        self.navigationItem.setLeftBarButton(backBtn, animated: false)
    }
    
    private func setNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDown), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeKeyboardObserver() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardUp(notification:NSNotification) {
        if let keyboardFrame:NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let safeHeight = self.view.safeAreaInsets.bottom
            
            UIView.animate(
                withDuration: 0.3
                , animations: {
                    self.bottomView.transform =
                    CGAffineTransform(translationX: 0, y: -(keyboardRectangle.height - safeHeight))
                }
            )
        }
    }
    
    @objc func keyboardDown() {
        self.bottomView.transform = .identity
    }
}

// MARK: - UICollectionView Delegate, DataSource
extension PostWriteVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoModel.userSelectedImages.count + 1  /// 이미지 추가 셀 항상 있어야 하므로 + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let addPhotoIdentifier = AddPhotoCVC.identifier
        let listPhotoIdentifer = ListPhotoCVC.identifier
        
        /// 첫 번째 cell은 항상 add photo
        if indexPath.item == 0 {
            guard let addCell = collectionView.dequeueReusableCell(withReuseIdentifier: addPhotoIdentifier, for: indexPath) as? AddPhotoCVC else { fatalError("Failed to dequeue cell for AddPhotoCVC") }
            addCell.delegate = self
            
            if photoModel.userSelectedImages.count == 0 {
                addCell.cameraButton.setImage(UIImage(named: "icn_photo"), for: .normal)
                addCell.countLabel.textColor = UIColor.carrotLineGray
            } else {
                addCell.cameraButton.setImage(UIImage(named: "icn_photo_selected"), for: .normal)
                addCell.countLabel.textColor = UIColor.carrotTextOrange
            }
            addCell.countLabel.text = "\(photoModel.userSelectedImages.count)"
            
            return addCell
        } else {
            /// 그 외의 셀은 사용자가 고른 사진으로 구성된 cell
            guard let listCell = collectionView.dequeueReusableCell(withReuseIdentifier: listPhotoIdentifer, for: indexPath) as? ListPhotoCVC else { fatalError("Failed to dequeue cell for ListPhotoCVC") }
            listCell.delegate = self
            listCell.indexPath = indexPath.item
            
            /// 사용자가 앨범에서 고른 사진이 있는 경우
            if photoModel.userSelectedImages.count > 0 {
                listCell.photoImageView.image = photoModel.userSelectedImages[indexPath.item - 1]
            }
            return listCell
        }
    }
}


//MARK: - AddImageDelegate
extension PostWriteVC: AddImageDelegate {
    func didPickImagesToUpload(images: [UIImage]) {
        photoModel.userSelectedImages = images
        photoCollectionView.reloadData()
    }
}

//MARK: - ListPhotoCVCDelegate
extension PostWriteVC: ListPhotoCVCDelegate {
    func didPressDeleteBtn(at index: Int) {
        photoModel.userSelectedImages.remove(at: index - 1)
        photoCollectionView.reloadData()
    }
}

// MARK: - UICollectionView DelegateFlowLayout
extension PostWriteVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

// MARK: - contextTextView Placeholder 설정
extension PostWriteVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor(named: "carrot_square_gray") {
            textView.text = nil
            textView.textColor = UIColor.carrotBlack
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "내용을 작성해주세요."
            textView.textColor = UIColor(named: "carrot_square_gray")
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        textView.constraints.forEach { cons in
            if estimatedSize.height <= 320 {
                
            } else {
                if cons.firstAttribute == .height {
                    cons.constant = estimatedSize.height
                }
            }
        }
        
    }
}

// MARK: - priceTextField Max Length 설정
extension PostWriteVC: UITextFieldDelegate {
    func checkMaxLength(_ textField: UITextField,_ maxLength: Int) {
        if textField.text!.count > maxLength {
            textField.deleteBackward()
        }
    }
}

extension PostWriteVC {
    func createPostWrite() {
        guard let price = priceTextField.text?.replacingOccurrences(of: ",", with: "") else { return }
        guard let intPrice = Int(price) else { return }
        guard let title = titleTextField.text,
              let category = categoryTextField.text,
              let contents = contextTextView.text else { return }
        let boolPriceOffer = priceOfferButton.isSelected ? true : false
        
        HomeService.shared.createPostWrite(imageCount: photoModel.userSelectedImages.count,
                                           title: title,
                                           category: category,
                                           price: intPrice,
                                           contents: contents,
                                           isPriceSuggestion: boolPriceOffer ) { networkResult in
            switch networkResult {
            case .success(let model):
                guard let model = model as? PostWrite else { return }
                let priceSuggestionStr = boolPriceOffer ? "가격제안 가능" : "가격제안 불가"
                let detailModel = PostDetail.init(_id: model.id,
                                                 image: ["https://dnvefa72aowie.cloudfront.net/origin/article/202205/be6893a11bf0a24b1c6f3dfc2cd02d7affd0c7566e877576050155e5bd337d4b.webp?q=95&s=1440x1440&t=inside"],
                                                 user: User.init(profile: "postDetail_1",
                                                                 name: "수빈",
                                                                 area: "잠실동"),
                                                 onSale: 0,
                                                 title: title,
                                                 category: category,
                                                 createdAt: "1분전",
                                                 content: contents,
                                                 view: 1,
                                                 price: price,
                                                 isPriceSuggestion: priceSuggestionStr,
                                                 isLiked: false )
                let nextVC = PostDetailVC2.instantiate()
                nextVC.detailModel = detailModel
                if let rootVC = self.navigationController?.viewControllers.first as? PostListVC {
                    self.navigationController?.popViewController(animated: true)
                    rootVC.navigationController?.pushViewController(nextVC, animated: true)
                }
            
                print(model)
            default:
                break;
            }
        }
    }
}
