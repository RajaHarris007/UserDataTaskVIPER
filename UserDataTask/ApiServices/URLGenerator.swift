//
//  URLGenerator.swift
//  UserDataTask
//
//  Created by RAJA LAKSHMANAN on 06/04/24.
//

import Foundation

fileprivate let baseURLString = "https://gorest.co.in/public/v2/"

enum URLGenerator: String {
    case UserApi = "users"
    
    func getUrl(type: Self) -> String {
        var urlString: String = ""
        switch type {
        case .UserApi:
            urlString = baseURLString + self.rawValue
        }
        return urlString
    }
}
