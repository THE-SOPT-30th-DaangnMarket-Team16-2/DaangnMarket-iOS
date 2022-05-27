//
//  ListTableViewCell.swift
//  DaangnMarket-iOS
//
//  Created by Zaid Kang on 2022/05/27.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    static let identifier = "FeedTableViewCell"

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setData(_ listData: PostListDataModel){
        productImage.image = listData.productImage
        productName.text = listData.productName
        place.text = listData.placeName
        productPrice.text = listData.price
        
        
        
    }
    

}

