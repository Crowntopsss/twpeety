//
//  MainTabController.swift
//  twpeety
//
//  Created by Temitope on 09/04/2021.
//

import UIKit
import Firebase

class MainTabController: UITabBarController {
    
    // MARK: - Properties
    var user : User?{
        didSet{
            guard let nav = viewControllers?[0] as? UINavigationController else {return}
            guard let feed = nav.viewControllers.first as? FeedController else {return}
            
            feed.user = user
        }
    
    }
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named:"new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Selectors
    @objc func actionButtonTapped() {
        guard let user = user else {return}
        let controller = UploadTweetController(user: user)
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
    }
    
    
    // MARK: -  LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .twitterBlue
        authenticateUsersAndConfigure()
//        logUserOut()
        
    }
    
    // MARK: - API
    
    func authenticateUsersAndConfigure(){
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async{
                let nav =  UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        }else{
            configureViewController()
            configureUI()
            fetchUser()
        }
    }
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        UserService.shared.fetchUsers(uid: uid) { user in
            self.user = user
        }
    }
    
    
    func logUserOut(){
        do{
            try Auth.auth().signOut()
            print("log user out")
        }catch let error {
            print("Failed to sign out")
        }
    }
    
    // MARK: - Helpers
    func configureUI() {
        view.addSubview(actionButton)
        actionButton.anchor( bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56/2
    }
    
     
    func configureViewController() {

        let feed =  FeedController(collectionViewLayout: UICollectionViewFlowLayout())
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
