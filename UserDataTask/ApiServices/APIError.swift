//
//  APIError.swift
//  UserDataTask
//
//  Created by RAJA LAKSHMANAN on 06/04/24.
//

import Foundation

enum APIError: Error {
  case invalidResponse(URLResponse?, Error?)
  case decodingError
  case invalidURLError
  case networkError(Error)
  case Other(Error)

  static func map(_ error: Error) -> APIError {
    return (error as? APIError) ?? .Other(error)
  }

    func errorMessage() -> String {
        var message = ""
        switch self {
        case .invalidResponse(let response, let errors ):
            message = "Error with the response, unexpected result. \n response: \(String(describing: response))\n error : \(String(describing: errors?.localizedDescription))"
            break
        case .decodingError:
            message = "Decoding error"
            break
        case .networkError(let errors):
            message = "\(errors.localizedDescription)"
            break
        case .invalidURLError:
            message = "Invalid URL"
            break
        case .Other(let errors):
            message = "\(errors.localizedDescription)"
            break
        }
        return message
    }
}
