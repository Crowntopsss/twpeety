//
//  FeedController.swift
//  twpeety
//
//  Created by Temitope on 09/04/2021.
//

import UIKit

class FeedController: UIViewController {

    // MARK: - Properties
    
    // MARK: -  LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()


    }
    
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView

    }

}
