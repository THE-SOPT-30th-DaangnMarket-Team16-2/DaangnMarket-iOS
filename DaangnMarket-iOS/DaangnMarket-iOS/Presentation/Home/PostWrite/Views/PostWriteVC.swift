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
    
    // MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        navigationBarUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addKeyboardObserver()
        setNavigationBar()
    }
    
    deinit {
        removeKeyboardObserver()
    }
    
    // MARK: - IBAction Part
    
    @IBAction func titleEditingChanged(_ sender: UITextField) {
        checkMaxLength(titleTextField, 20)
    }
    
    @IBAction func categoryEditingChanged(_ sender: UITextField) {
        checkMaxLength(categoryTextField, 20)
    }
    
    @IBAction func priceEditingChanged(_ sender: UITextField) {
        priceSectionCustom()
    }
    
    @IBAction func offerBtnDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    // MARK: - Custom Method Part
    private func setDelegate() {
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        priceTextField.delegate = self
        contextTextView.delegate = self
    }
    
    private func setNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func navigationBarUI() {
        let naviCompleteButton: UIButton =  {
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
        
        let naviBackButton: UIButton =  {
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
        
        let completeBtn = UIBarButtonItem(customView: naviCompleteButton)
        let backBtn = UIBarButtonItem(customView: naviBackButton)
        
        self.navigationItem.title = "중고거래 글쓰기"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.carrotBlack,
                                                                        NSAttributedString.Key.font : UIFont.NotoBold(size: 16)]
        
        self.navigationItem.setRightBarButton(completeBtn, animated: false)
        self.navigationItem.setLeftBarButton(backBtn, animated: false)
    }
    
    private func priceSectionCustom() {
        checkMaxLength(priceTextField, 11) /// 999,999,999
        priceOfferButton.isEnabled = priceTextField.hasText
        
        if priceTextField.text?.isEmpty == true {
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
    
    private func numberFormatter(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: number))!
    }
    
    private func scrollToCursor() {
        let caret = contextTextView.caretRect(for: contextTextView.selectedTextRange!.start)
        let offset = CGPoint(x: 0,
                             y: writeScrollView.contentSize.height - writeScrollView.bounds.height - 100 + caret.origin.y)
        writeScrollView.setContentOffset(offset, animated: true)
    }
    
    private func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDown), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeKeyboardObserver() {
        NotificationCenter.default.removeObserver(self)
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

// MARK: - UITextViewDelegate
extension PostWriteVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        scrollToCursor()
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
        scrollToCursor()
        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        textView.constraints.forEach { cons in
            if !(estimatedSize.height <= 400) {
                if cons.firstAttribute == .height {
                    cons.constant = estimatedSize.height
                }
            }
        }
    }
}

// MARK: - UITextFieldDelegate
extension PostWriteVC: UITextFieldDelegate {
    func checkMaxLength(_ textField: UITextField,_ maxLength: Int) {
        if textField.text!.count > maxLength {
            textField.deleteBackward()
        }
    }
}

// MARK: - NETWORK
extension PostWriteVC {
    func createPostWrite() {
        guard let price = priceTextField.text?.replacingOccurrences(of: ",", with: ""),
              let intPrice = Int(price),
              let title = titleTextField.text,
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
                let detailModel = PostDetail.init(onSale: "0",
                                                  category: category,
                                                  id: model.id,
                                                  price: intPrice,
                                                  title: title,
                                                  image: ["https://dnvefa72aowie.cloudfront.net/origin/article/202205/be6893a11bf0a24b1c6f3dfc2cd02d7affd0c7566e877576050155e5bd337d4b.webp?q=95&s=1440x1440&t=inside"],
                                                  view: 1,
                                                  isPriceSuggestion: boolPriceOffer,
                                                  createdAt: "방금 전",
                                                  isLiked: false,
                                                  user: User.init(region: "잠실 3동", id: "", name: "아요미", profile: ""))
                let nextVC = PostDetailVC2.instantiate()
                nextVC.postId = model.id
                nextVC.imageCount = self.photoModel.userSelectedImages.count
                nextVC.fromPostWrite = true
                nextVC.detailModel = detailModel
                if let rootVC = self.navigationController?.viewControllers.first as? PostListVC2 {
                    self.navigationController?.popViewController(animated: true)
                    rootVC.navigationController?.pushViewController(nextVC, animated: true)
                }
            default:
                break;
            }
        }
    }
}
