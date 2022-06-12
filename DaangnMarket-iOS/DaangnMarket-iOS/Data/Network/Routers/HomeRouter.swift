//
//  HomeRouter.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/25.
//

import Foundation
import Alamofire

enum HomeRouter {
    case getPostList
    case getPostWithPage(page: Int, limit: Int)
    case createPostWrite(imageCount: Int, title: String, category: String, price: Int, contents: String, isPriceSuggestion: Bool)
    case getPostDetail(postId: String)
    case changeLikeStatus(postId: String)
    case changeSellStatus(postId: String, onSale: String)
}

extension HomeRouter: BaseRouter {
    
    var path: String {
        switch self {
        case .getPostList:
            return "/feed"
        case .getPostWithPage:
            return "/feed_page"
        case .createPostWrite(_, _, _, _, _, _):
            return "/feed"
        case .getPostDetail(let postId):
            return "/feed/\(postId)"
        case .changeLikeStatus(let postId):
            return "/feed/like/\(postId)"
        case .changeSellStatus(_, _):
            return "/feed/on-sale"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getPostList:
            return .get
        case .getPostWithPage(_, _):
            return .get
        case .createPostWrite(_, _, _, _, _, _):
            return .post
        case .getPostDetail(_):
            return .get
        case .changeLikeStatus(_):
            return .put
        case .changeSellStatus(_, _):
            return .put
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .getPostList:
            return .requestPlain
            
        case .getPostWithPage(let page, let limit):
            let params: [String : Any] =
            ["page" : page,
             "limit" : limit]
            return .query(params)
            
        case .createPostWrite(let imageCount, let title, let category, let price, let contents, let isPriceSuggestion):
            let body: [String : Any] =
            ["imageCount" : imageCount,
             "title" : title,
             "category" : category,
             "price" : price,
             "contents" : contents,
             "isPriceSuggestion" : isPriceSuggestion]
            return .requestBody(body)
            
        case .getPostDetail(_):
            return .requestPlain

        case .changeLikeStatus(_):
            return .requestPlain
            
        case .changeSellStatus(let postId, let onSale):
            let body: [String : Any] =
            ["id": postId,
             "onSale": onSale]
            return .requestBody(body)
        }
    }
}

