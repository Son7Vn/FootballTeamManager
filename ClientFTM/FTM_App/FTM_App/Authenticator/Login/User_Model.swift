//
//  User_Model.swift
//  FTM_App
//
//  Created by SonGoku on 22/09/2022.
//

import UIKit

struct Login_Data: Decodable {
    var user: User
    var token: String
    var message: String
}

struct User: Decodable {
    var _id: String
    var username: String
    var email: String
//    let avatar: String
//    let admin: Bool
//    let createdAt: String
//    let updateAt: String
}

struct Message: Decodable {
    var message: String
}
