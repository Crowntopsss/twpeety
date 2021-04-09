//
//  MainTabController.swift
//  twpeety
//
//  Created by Temitope on 09/04/2021.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Properties
    
    // MARK: -  LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()

    }
    
    // MARK: - Helpers
     
    func configureViewController() {

        let feed =  FeedController()
        let nav1 = templateNavigatioController(image: UIImage(named: "home_unselected"), rootViewController: feed)
        
        
        let explore = ExploreController()
        let nav2 = templateNavigatioController(image: UIImage(named: "search_unselected"), rootViewController: explore)
        
        let notification = NotificationController()
        let nav3 = templateNavigatioController(image: UIImage(named: "like_unselected"), rootViewController: notification)
        
        let conversation =  ConversationController()
        let nav4 = templateNavigatioController(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootViewController: conversation)
        viewControllers = [nav1, nav2, nav3, nav4]
        
    }
    
    func templateNavigatioController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav =  UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
    }
    

}
