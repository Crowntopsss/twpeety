//
//  ProfileHeader.swift
//  twpeety
//
//  Created by Temitope on 24/04/2021.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
  
    
    // MARK: - Properties

    // MARK: - LifeCycle
    
    override init(frame:CGRect){
        super.init(frame: frame)
        
        backgroundColor = .systemRed
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
