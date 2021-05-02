//
//  UserService.swift
//  twpeety
//
//  Created by Temitope on 15/04/2021.
//

import Foundation
import Firebase

typealias DatabaseCompletion = ((Error?, DatabaseReference) -> Void)

struct  UserService {
    static let shared = UserService()
    
    func fetchUsers(uid: String, completion: @escaping(User) -> Void){
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary =  snapshot.value as? [String: AnyObject] else {return}
            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
        }
        
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void) {
        var users = [User]()
        REF_USERS.observe(.childAdded) { snapshot in
            let uid = snapshot.key
            guard let dictionary = snapshot.value as? [String: AnyObject] else {return}
            let user =  User(uid: uid, dictionary: dictionary)
            users.append(user)
            completion(users)
        }
    }
    func followUser(uid: String, completion: @escaping (Error?, DatabaseReference) -> Void){
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        REF_USER_FOLLOWING.child(currentUid).updateChildValues([uid : 1]) { (err, ref) in
            REF_USER_FOLLOWERS.child(uid).updateChildValues([currentUid : 1], withCompletionBlock: completion)
        }
    }
    
    func unfollowUser(uid: String, completion: @escaping (DatabaseCompletion)) {
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        REF_USER_FOLLOWING.child(currentUid).child(uid).removeValue { (err, ref) in
            REF_USER_FOLLOWERS.child(uid).child(currentUid).removeValue(completionBlock: completion)
        }
            
    }
    
}
