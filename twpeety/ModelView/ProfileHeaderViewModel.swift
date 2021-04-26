//
//  ProfileHeaderViewModel.swift
//  twpeety
//
//  Created by Temitope on 25/04/2021.
//

import UIKit

enum ProfileFilterOption: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var description: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Tweets & Replies"
        case .likes: return "Likes"

        }
    }
}

struct ProfileHeaderViewModel {
    private let user: User
    
    var followersString: NSAttributedString? {
        return attributedText(withValue: 0, text: " Followers")
        
    }
    
    var followingString: NSAttributedString? {
        return attributedText(withValue: 3, text: " Following")
    }
    
    var actionButtonTitle: String {
        if user.isCurrentUser == true {
            return "Edit Profile"
        } else{
            return "Follow"
        }
    }
    init(user: User) {
        self.user = user
    }
    
    fileprivate func attributedText(withValue value: Int, text:String) -> NSAttributedString {
        let attributedTitle = NSMutableAttributedString(string: "\(value)", attributes: [.font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.black])
        attributedTitle.append(NSMutableAttributedString(string: "\(text)", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        
        return attributedTitle
    }
}
