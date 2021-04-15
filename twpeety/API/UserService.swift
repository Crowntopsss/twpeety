//
//  UserService.swift
//  twpeety
//
//  Created by Temitope on 15/04/2021.
//

import Foundation
import Firebase

struct  UserService {
    static let shared = UserService()
    
    func fetchUsers(){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary =  snapshot.value as? [String: AnyObject] else {return}
            let user = User(uid: uid, dictionary: dictionary)
            print(user.username)
            print(user.fullname)
            print(user.uid)
        }
        
    }
}
