//
//  UserModel.swift
//  JSON_UiKit
//
//  Created by Pierre Juarez U. on 3/07/23.
//

import Foundation

struct UserModel: Decodable{
    var data: [UserList]
}

struct User: Decodable{
    var data: UserList
}

struct UserList: Decodable{
    var id: Int
    var first_name: String
    var email: String
    var avatar: String
}
