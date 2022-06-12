//
//  PostTVC.swift
//  DaangnMarket-iOS
//
//  Created by subinyoon on 2022/05/26.
//

import UIKit

final class PostTVC: UITableViewCell {
    
    static let identifier = "PostTVC"
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemRegionLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(_ itemData: PostList) {
        if let image = itemData.image {
            let url = URL(string: image)
            let data = try! Data(contentsOf: url!)
            itemImageView.image = UIImage(data: data)
        }
        let price = String(itemData.price).replacingOccurrences(of: ",", with: "")
        itemPriceLabel.text = numberFormatter(number: Int(price)!) + "원"
        itemTitleLabel.text = itemData.title
        itemRegionLabel.text = itemData.region
        createdAtLabel.text = itemData.createdAt
    }
    
    private func numberFormatter(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: number))!
    }
}
