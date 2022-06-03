//
//  responseDTO.swift
//  DaangnMarket-iOS
//
//  Created by Zaid Kang on 2022/06/03.
//

import Foundation

struct responseDTO: Codable {
    var status: Int
    let success: Bool
    let message: String
    let data: [PostListDataModel]
}
