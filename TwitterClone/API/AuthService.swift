//
//  AuthService.swift
//  TwitterClone
//
//  Created by Miks Freibergs on 22/02/2021.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}

struct AuthService {
    static let shared = AuthService()
    
    func logUserIn(withEmail email: String, password: String, completion: AuthDataResultCallback?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    func registeredUser(credentials: AuthCredentials, completion: @escaping(Error?) -> Void) {
        guard let imageData = credentials.profileImage.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let storageRef = STORAGE_PROFILE_IMAGES.child(filename)
        
        Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) {  (result, error) in
            if let error = error {
                print("Error is \(error.localizedDescription)")
                return
            }
            
            storageRef.putData(imageData, metadata: nil) { (meta, error) in
                storageRef.downloadURL { (url, error) in
                    guard let profileImageUrl = url?.absoluteString else { return }
                    
                    guard let uid = result?.user.uid else { return }
                    
                    let values = ["email": credentials.email,
                                  "username": credentials.username,
                                  "fullname": credentials.fullname,
                                  "profileImageUrl": profileImageUrl]
                    
                    REF_USERS.document(uid).setData(values, completion: completion)
                }
            }
        }
    }
}
