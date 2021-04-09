//
//  ConversationController.swift
//  twpeety
//
//  Created by Temitope on 09/04/2021.
//

import UIKit

class ConversationController: UIViewController {

    // MARK: - Properties
    
    // MARK: -  LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

    }
    
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Messages"

    }
    

}
