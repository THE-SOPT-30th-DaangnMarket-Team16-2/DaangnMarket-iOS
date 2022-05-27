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
}

extension HomeRouter: BaseRouter {
    
    var path: String {
        switch self {
        case .getPostDetail(let postId):
            return "/feed/\(postId)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var parameters: RequestParams {
        switch self {
        default:
            return .requestPlain
        }
    }
}

