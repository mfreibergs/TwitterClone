//
//  Constants.swift
//  TwitterClone
//
//  Created by Miks Freibergs on 18/02/2021.
//

import Firebase

let DB_REF = Firestore.firestore()
let REF_USERS = DB_REF.collection("users")

let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("proifle_images")
