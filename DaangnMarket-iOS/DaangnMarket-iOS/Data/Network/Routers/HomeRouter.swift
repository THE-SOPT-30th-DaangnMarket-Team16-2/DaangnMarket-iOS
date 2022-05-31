//
//  HomeRouter.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/25.
//

import Foundation
import Alamofire

enum HomeRouter {
    case getPostDetail(postId: String)
    case changeSellStatus(postId: String, onSale: Int)
}

extension HomeRouter: BaseRouter {
    
    var path: String {
        switch self {
        case .getPostDetail(let postId):
            return "/feed/\(postId)"
        case .changeSellStatus(_, _):
            return "/feed/on-sale"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getPostDetail(_):
                return .get
        case .changeSellStatus(_, _):
                return .put
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .getPostDetail(_):
            return .requestPlain
        case .changeSellStatus(let postId, let onSale):
            let body: [String : Any] =
            ["id": postId,
             "onSale": onSale ]
            return .requestBody(body)
        }
    }
}

