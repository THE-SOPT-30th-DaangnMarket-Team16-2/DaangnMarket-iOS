//
//  PostListDataModel.swift
//  DaangnMarket-iOS
//
//  Created by Zaid Kang on 2022/05/27.
//

import Foundation
import UIKit

struct PostListDataModel {
    let productImageName: String
    var productImage: UIImage? {
        return UIImage(named: productImageName)
    }
    let productName: String
    let placeName: String
    let price: Int
}


extension PostListDataModel{
    static let sampleData: [PostListDataModel] = [
        PostListDataModel(productImageName: "proImageName01", productName: "의자", placeName: "", price: 15000),
        PostListDataModel(productImageName: "proImageName01", productName: "테이블", placeName: "", price: 32000),
        PostListDataModel(productImageName: "proImageName01", productName: "노트북", placeName: "", price: 480000),
        PostListDataModel(productImageName: "proImageName01", productName: "노트북", placeName: "", price: 480000),
        PostListDataModel(productImageName: "proImageName01", productName: "노트북", placeName: "", price: 480000),
        PostListDataModel(productImageName: "proImageName01", productName: "노트북", placeName: "", price: 480000),
        PostListDataModel(productImageName: "proImageName01", productName: "노트북", placeName: "", price: 480000),    ]
}
