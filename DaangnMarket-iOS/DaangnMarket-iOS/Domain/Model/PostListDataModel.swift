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
    let price: String
}


extension PostListDataModel{
    static let sampleData: [PostListDataModel] = [
        PostListDataModel(productImageName: "productImageName00", productName: "의자", placeName: "경기도 성남시 분당구", price: "15000원"),
        PostListDataModel(productImageName: "productImageName01", productName: "테이블", placeName: "경기도 용인시 수지구", price: "32000원"),
        PostListDataModel(productImageName: "productImageName02", productName: "노트북", placeName: "경기도 수원시 팔달구", price: "32000원"),
        PostListDataModel(productImageName: "productImageName03", productName: "선풍기", placeName: "", price: "32000원"),
        PostListDataModel(productImageName: "productImageName04", productName: "데스크탑", placeName: "", price: "32000원"),
        PostListDataModel(productImageName: "productImageName05", productName: "귀걸이", placeName: "", price: "32000원"),
        PostListDataModel(productImageName: "productImageName06", productName: "노트북", placeName: "", price: "32000원"),    ]
}
