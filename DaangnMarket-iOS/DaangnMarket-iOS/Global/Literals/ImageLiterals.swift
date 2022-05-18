//
//  ImageLiterals.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/16.
//

import UIKit

struct ImageLiterals{
    
    struct MainTabBar{
        static let homeIcon = UIImage(systemName: "heart")
        static let homeIcon_selected = UIImage(systemName: "Contacts")
    }
    
    struct PostList {
        
    }
    
    struct PostDetail {
        static let faceIcon = UIImage(named: "icn_face")
        static let heartOffIcon = UIImage(named: "icn_heart_off")
        static let hearOnIcon = UIImage(named: "icn_heart_on")
        static let homeIcon = UIImage(named: "icn_home")
        static let moreIcon = UIImage(named: "icn_more")
        static let arrowIcon = UIImage(named: "icn_arrow")
        
        static let dummy1 = UIImage(named: "postDetail_1")
        static let dummy2 = UIImage(named: "postDetail_2")
        static let dummy3 = UIImage(named: "postDetail_3")
        static let dummy4 = UIImage(named: "postDetail_4")
        static let dummy5 = UIImage(named: "postDetail_5")
        
        static var sample: [UIImage?] =
            [dummy1, dummy2, dummy3, dummy4, dummy5]
    }
    
    struct PostWrite {
        
    }
}
