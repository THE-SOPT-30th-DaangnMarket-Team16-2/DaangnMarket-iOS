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
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(itemData: ItemModel) {
        itemImageView.image = UIImage(named: itemData.itemImage)
        itemNameLabel.text = itemData.itemName
        itemPriceLabel.text = itemData.itemPrice
    }
}
