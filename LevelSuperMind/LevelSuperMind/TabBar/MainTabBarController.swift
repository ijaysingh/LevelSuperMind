//
//  MainTabBarController.swift
//  LevelSuperMind
//
//  Created by Cedcoss on 27/02/25.
//
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private let customTabBar = CustomTabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValue(customTabBar, forKey: "tabBar")
        setupTabs()
        customizeTabBarAppearance()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame = CGRect(x: 0,
                              y: view.frame.height - tabBar.frame.height,
                              width: view.frame.width,
                              height: tabBar.frame.height)
    }
    
}

// MARK: Tabbar Functions
extension MainTabBarController{
    
    private func setupTabs() {
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let accountVC = UINavigationController(rootViewController: AccountViewController())
        
        homeVC.tabBarItem = UITabBarItem(title: "Today",
                                         image: UIImage(named: "unselected_home")?.withRenderingMode(.alwaysTemplate),
                                         selectedImage: UIImage(named: "selected_home")?.withRenderingMode(.alwaysTemplate))
        
        searchVC.tabBarItem = UITabBarItem(title: "Explore",
                                           image: UIImage(named: "unselected_search")?.withRenderingMode(.alwaysTemplate),
                                           selectedImage: UIImage(named: "unselected_search")?.withRenderingMode(.alwaysTemplate))
        
        accountVC.tabBarItem = UITabBarItem(title: "You",
                                            image: UIImage(named: "unselected_account")?.withRenderingMode(.alwaysTemplate),
                                            selectedImage: UIImage(named: "selected_account")?.withRenderingMode(.alwaysTemplate))
        
        self.viewControllers = [homeVC, searchVC, accountVC]
    }
    
    private func customizeTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.appBackground
        
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray,
            .font: UIFont.systemFont(ofSize: 12, weight: .regular)
        ]
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 12, weight: .regular)
        ]
        
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.tabBarUnselected
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes
        appearance.stackedLayoutAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -8)
        
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.tabBarSelected
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes
        appearance.stackedLayoutAppearance.selected.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -8)
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .gray
    }
    
}
