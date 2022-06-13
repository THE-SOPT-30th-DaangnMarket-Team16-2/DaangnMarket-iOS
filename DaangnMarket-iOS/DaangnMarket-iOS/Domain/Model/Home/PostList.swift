//
//  PostList.swift
//  DaangnMarket-iOS
//
//  Created by Zaid Kang on 2022/05/27.
//

import Foundation
import UIKit

struct PostList: Codable {
    let id: String
    let title: String
    let region: String
    var image: String?
    let price: Int
    let createdAt: String
}
