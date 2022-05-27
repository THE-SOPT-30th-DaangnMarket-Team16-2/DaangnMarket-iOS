//
//  ItemModel.swift
//  DaangnMarket-iOS
//
//  Created by subinyoon on 2022/05/26.
//

import UIKit

struct ItemModel {
    let itemImage: String
    let itemName: String
    let itemPrice: String
}

extension ItemModel {
    static let samplePost: [ItemModel] = [
        ItemModel(itemImage: "postDetail_1", itemName: "샘플 1번", itemPrice: "5,000원"),
        ItemModel(itemImage: "postDetail_2", itemName: "샘플 2번", itemPrice: "6,000원"),
        ItemModel(itemImage: "postDetail_3", itemName: "샘플 3번", itemPrice: "7,000원"),
        ItemModel(itemImage: "postDetail_4", itemName: "샘플 4번", itemPrice: "8,000원"),
        ItemModel(itemImage: "postDetail_5", itemName: "샘플 5번", itemPrice: "9,000원")
    ]
}
