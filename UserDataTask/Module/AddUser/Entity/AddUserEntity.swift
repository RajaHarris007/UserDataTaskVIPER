//
//  AddUserEntity.swift
//  UserDataTask
//
//  Created by RAJA LAKSHMANAN on 07/04/24.
//

import Foundation

struct AddUserResponseObject: Codable {
    let id: Int?
    let name:String?
    let email: String?
    let gender: String?
    let status: String?
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case email = "email"
        case gender = "gender"
        case status = "status"
    }
}
