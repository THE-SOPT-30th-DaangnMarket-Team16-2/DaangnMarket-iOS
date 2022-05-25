//
//  PostDetail.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/25.
//

import Foundation

// MARK: - PostDetail
struct PostDetail: Codable {
    let image: [String]
    let user: User
    let onSale: Int
    let title, category, createdAt, content: String
    let view: Int
    let price: String
    let isPriceSuggestion: String
    let isLiked: Bool
}

// MARK: - User
struct User: Codable {
    let profile: String
    let name, area: String
}
