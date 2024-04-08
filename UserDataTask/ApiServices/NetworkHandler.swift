//
//  NetworkHandler.swift
//  UserDataTask
//
//  Created by RAJA LAKSHMANAN on 06/04/24.
//

import Foundation

class NetworkHandler {
    static let sharedHandler = NetworkHandler()
    
    private init (){
        
    }
    public func startNetworkRequest(urlString: URLGenerator, method: HTTPMethodType, headers: [String: String]?, body: Data?, completion: @escaping (Result<Data, APIError>) -> Void) {
        
        guard let requestUrl = URL(string: urlString.getUrl(type: urlString)) else {
            completion(.failure(.invalidURLError))
            return
        }
                
        var request = URLRequest(url: requestUrl)
        request.httpMethod = method.httpMethodForRequest()
        request.httpBody = body
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse(response, error)))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse(response, error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidResponse(response, error)))
                return
            }
            
            completion(.success(data))
        }
        task.resume()
    }
}

//MARK: HTTP MethodType
enum HTTPMethodType: Int {
    case methodTypeGET
    case methodTypePOST
    
    func httpMethodForRequest() -> String{
        switch  self {
        case .methodTypeGET:
            return "GET"
        case .methodTypePOST :
            return "POST"
            // Add more methods as needed
        }
    }
}

//MARK: Request Header Generator
public func getHeaderBody() -> [String: String] {
    let token = "138cddf955126a8ee2fbdd53894bd7db9b7127d422939577b2f34102b22c47da"
    if token != "" {
        return ["Content-Type": "application/json","Authorization": "Bearer" + " " + token]
    }else{
        return ["Content-Type": "application/json"]
    }
}

