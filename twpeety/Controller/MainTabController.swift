//
//  MainTabController.swift
//  twpeety
//
//  Created by Temitope on 09/04/2021.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Properties
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.setImage(UIImage(named:"new_tweet"), for: .normal)
        return button
    }()
    
    
    
    // MARK: -  LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureUI()

    }
    
    // MARK: - Helpers
    func configureUI() {
        view.addSubview(actionButton)
        actionButton.anchor( bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56/2
    }
    
     
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
