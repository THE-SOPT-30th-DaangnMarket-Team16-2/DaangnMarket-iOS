//
//  PostListDataModel.swift
//  DaangnMarket-iOS
//
//  Created by Zaid Kang on 2022/05/27.
//

import Foundation

struct PostListDataModel {
    let productImageName: String
    let productName: String
    let placeName: String
    let price: Int
}


extension PostListDataModel{
    static let sampleData: [PostListDataModel] = [
        PostListDataModel(productImageName: "proImageName01", productName: <#T##String#>, placeName: "", price: <#T##Int#>),
        PostListDataModel(productImageName: "proImageName01", productName: <#T##String#>, placeName: "", price: <#T##Int#>),
        PostListDataModel(productImageName: "proImageName01", productName: <#T##String#>, placeName: "", price: <#T##Int#>),
        PostListDataModel(productImageName: "proImageName01", productName: <#T##String#>, placeName: "", price: <#T##Int#>),
        PostListDataModel(productImageName: "proImageName01", productName: <#T##String#>, placeName: "", price: <#T##Int#>),
        PostListDataModel(productImageName: "proImageName01", productName: <#T##String#>, placeName: "", price: <#T##Int#>),
        PostListDataModel(productImageName: "proImageName01", productName: <#T##String#>, placeName: "", price: <#T##Int#>),    ]
}
