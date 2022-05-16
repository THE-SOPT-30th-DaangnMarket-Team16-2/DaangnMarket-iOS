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
            selectedImage: ImageLiterals.MainTabBar.homeIcon,
            rootViewController: PostListVC.instantiate())
        
        let townNVC = makeNavigationController(
            unselectedImage: ImageLiterals.MainTabBar.homeIcon,
            selectedImage: ImageLiterals.MainTabBar.homeIcon,
            rootViewController: TownVC())
        
        let aroundNVC = makeNavigationController(
            unselectedImage: ImageLiterals.MainTabBar.homeIcon,
            selectedImage: ImageLiterals.MainTabBar.homeIcon,
            rootViewController: AroundVC())
        
        let chatNVC = makeNavigationController(
            unselectedImage: ImageLiterals.MainTabBar.homeIcon,
            selectedImage: ImageLiterals.MainTabBar.homeIcon,
            rootViewController: ChatVC())
        
        let myPageNVC = makeNavigationController(
            unselectedImage: ImageLiterals.MainTabBar.homeIcon,
            selectedImage: ImageLiterals.MainTabBar.homeIcon,
            rootViewController: MyPageVC())
        
        viewControllers = [PostListNVC, townNVC, aroundNVC, chatNVC, myPageNVC]
    }
    
    private func setTabBar() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .black
    }
    
    private func makeNavigationController(unselectedImage: UIImage?, selectedImage: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        nav.navigationBar.backgroundColor = .white
        nav.isNavigationBarHidden = true
        nav.navigationBar.isHidden = true
        
        nav.navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: self, action: nil)
        nav.navigationItem.backBarButtonItem?.tintColor = .black
        return nav
    }
}
