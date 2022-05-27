//
//  AddPhotoCVC.swift
//  DaangnMarket-iOS
//
//  Created by subinyoon on 2022/05/18.
//

import UIKit
import BSImagePicker
import Photos


protocol AddImageDelegate: AnyObject {
    func didPickImagesToUpload(images: [UIImage])
}

final class AddPhotoCVC: UICollectionViewCell {
  
  static let identifier = "AddPhotoCVC"
  weak var delegate: AddImageDelegate?
  
  var selectedAssets: [PHAsset] = [PHAsset]()
  var userSelectedImages: [UIImage] = [UIImage]()
    
  @IBOutlet weak var cameraButton: UIButton!
  @IBOutlet weak var countLabel: UILabel!
  
  override func awakeFromNib() {
      super.awakeFromNib()
  }
  
  @IBAction func addBtnDidTap(_ sender: UIButton) {
    
    /// 기존 선택된 사진 모두 초기화
    selectedAssets.removeAll()
    userSelectedImages.removeAll()
    
    let imagePicker = ImagePickerController()
    imagePicker.settings.selection.max = 10
    imagePicker.settings.fetch.assets.supportedMediaTypes = [.image]
    
    let vc = self.window?.rootViewController
   
    vc?.presentImagePicker(imagePicker, select: { (asset) in
        
    }, deselect: { (asset) in

    }, cancel: { (assets) in

    }, finish: { (assets) in
        
        for i in 0..<assets.count {
            self.selectedAssets.append(assets[i])
        }
      
        self.convertAssetToImages()
        self.delegate?.didPickImagesToUpload(images: self.userSelectedImages)
    })
  }
  
  func convertAssetToImages() {
      
      if selectedAssets.count != 0 {
        
          for i in 0..<selectedAssets.count {
              
              let imageManager = PHImageManager.default()
              let option = PHImageRequestOptions()
              option.isSynchronous = true
              var thumbnail = UIImage()
              
              imageManager.requestImage(for: selectedAssets[i],
                                        targetSize: CGSize(width: 200, height: 200),
                                        contentMode: .aspectFit,
                                        options: option) { (result, info) in thumbnail = result! }
              
              let data = thumbnail.jpegData(compressionQuality: 0.7)
              let newImage = UIImage(data: data!)
              
              self.userSelectedImages.append(newImage! as UIImage)
          }
      }
  }
}
