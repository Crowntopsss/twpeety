//
//  ProfileHeaderViewModel.swift
//  twpeety
//
//  Created by Temitope on 25/04/2021.
//

import Foundation

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
