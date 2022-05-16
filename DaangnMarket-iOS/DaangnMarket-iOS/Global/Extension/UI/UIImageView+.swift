//
//  UIImageView+.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/16.
//

import UIKit

import Kingfisher
import RxSwift

@frozen
enum ResizingImagetype {
    case small
    case medium
    case large
}

@frozen
enum PlaceholderBackgroundColor: String {
    case sparkDarkGray = "sparkDarkGrayPlaceholder"
    case sparkLightGray = "sparkLightGrayPlaceholder"
}

extension UIImageView {
    /// URL 주소를 가지고 이미지 다운로드.
    ///
    /// type: 리사이징된 이미지를 설정할 수 있음.
    /// - small - 270*270
    /// - medium - 360*360
    /// - large - 720*720
    @discardableResult
    func updateImage(_ imagePath: String, type: ResizingImagetype = .small, placeholder: PlaceholderBackgroundColor = .sparkLightGray) -> Bool {
        guard let periodIndex = imagePath.lastIndex(of: ".") else {
            self.image = UIImage()
            return false
        }
        let imageURL = imagePath[imagePath.startIndex..<periodIndex]
        // .png or .jpeg
        let imageType = imagePath[periodIndex..<imagePath.endIndex]

        let resizingURL: String
        switch type {
        case .small:
            resizingURL = imageURL + "_270x270" + imageType
        case .medium:
            resizingURL = imageURL + "_360x360" + imageType
        case .large:
            resizingURL = imagePath
        }
        
        guard let url = URL(string: resizingURL) else {
            self.image = UIImage()
            return false
        }
        self.kf.indicatorType = .none
        self.kf.setImage(
            with: url,
            placeholder: UIImage(named: "\(placeholder.rawValue)"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.3)),
                .cacheOriginalImage
            ]) { result in
            switch result {
            case .success:
                return
            case .failure(let error):
                print("kingfisher work failed: \(error.localizedDescription)")
            }
        }
        return true
    }
    
    func setImage(with url: String, disposeBag: DisposeBag) {
        DefaultImageCacheService.shared.setImage(url)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] image in
                self?.image = UIImage(data: image)
            })
            .disposed(by: disposeBag)
    }
}
