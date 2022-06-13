//
//  MainTBC.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/16.
//

import UIKit

import RxSwift
import RxCocoa

final class MainTBC: UITabBarController {
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewControllers()
        setTabBar()
    }
    
    // MARK: Custom Methods
    
    private func setViewControllers() {
        let PostListNVC = makeNavigationController(
            unselectedImage: ImageLiterals.MainTabBar.homeIcon,
            selectedImage: ImageLiterals.MainTabBar.homeIcon_selected,
            rootViewController: PostListVC2.instantiate(), title: "홈")
        
        let townNVC = makeNavigationController(
            unselectedImage: ImageLiterals.MainTabBar.townIcon,
            selectedImage: ImageLiterals.MainTabBar.townIcon_selected,
            rootViewController: TownVC(), title: "동네생활")
        
        let aroundNVC = makeNavigationController(
            unselectedImage: ImageLiterals.MainTabBar.locationIcon,
            selectedImage: ImageLiterals.MainTabBar.locationIcon_selected,
            rootViewController: AroundVC(), title: "내 근처")
        
        let chatNVC = makeNavigationController(
            unselectedImage: ImageLiterals.MainTabBar.chatIcon,
            selectedImage: ImageLiterals.MainTabBar.chatIcon_selected,
            rootViewController: ChatVC(), title: "채팅")
        
        let myPageNVC = makeNavigationController(
            unselectedImage: ImageLiterals.MainTabBar.profileIcon,
            selectedImage: ImageLiterals.MainTabBar.profileIcon_selected,
            rootViewController: MyPageVC(), title: "나의 당근")
        
        viewControllers = [PostListNVC, townNVC, aroundNVC, chatNVC, myPageNVC]
    }
    
    private func setTabBar() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .black
    }
    
    private func makeNavigationController(unselectedImage: UIImage?, selectedImage: UIImage?, rootViewController: UIViewController, title: String) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.tabBarItem.title = title
        nav.navigationBar.tintColor = .black
        nav.navigationBar.backgroundColor = .white
        nav.isNavigationBarHidden = true
        nav.navigationBar.isHidden = true
        
        nav.navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: self, action: nil)
        nav.navigationItem.backBarButtonItem?.tintColor = .black
        return nav
    }
}
