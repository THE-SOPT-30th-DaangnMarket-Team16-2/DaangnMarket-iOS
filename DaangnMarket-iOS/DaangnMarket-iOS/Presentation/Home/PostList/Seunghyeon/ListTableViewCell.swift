//
//  ListTableViewCell.swift
//  DaangnMarket-iOS
//
//  Created by Zaid Kang on 2022/05/27.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    static let identifier = "ListTableViewCell"

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(_ listData: PostList){
  
        if let image = listData.image {
            let url = URL(string: image)
            let data = try! Data(contentsOf: url!)
            productImage.image = UIImage(data: data)
        }
//        let url = URL(string: listData.image!)
//        let data = try! Data(contentsOf: url!)
//        productImage.image = UIImage(data: data)
        productName.text = listData.title
        place.text = listData.region
        
        let price = String(listData.price).replacingOccurrences(of: ",", with: "")
        productPrice.text = numberFormatter(number: Int(price)!) + "원"
    }
    
    private func numberFormatter(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: number))!
    }
    
    
}

