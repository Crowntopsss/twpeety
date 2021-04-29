//
//  UserCell.swift
//  twpeety
//
//  Created by Temitope on 28/04/2021.
//

import UIKit

class UserCell: UITableViewCell {

    // MARK: - Properties
    
    
    private lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.setDimensions(width: 40, height: 40)
        iv.layer.cornerRadius = 40/2
        iv.backgroundColor = .twitterBlue
        
        return iv
    }()
    

    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Username"
        return label
    }()
    
    
    private let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Fullname"
        return label
    }()
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        backgroundColor = .white
        addSubview(profileImageView)
        profileImageView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 12)
        
        let stack =  UIStackView(arrangedSubviews: [usernameLabel, fullnameLabel])
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        stack.spacing = 2
        
        addSubview(stack)
        stack.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 12)
        
    }

}


