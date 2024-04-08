//
//  AddUserInteractor.swift
//  UserDataTask
//
//  Created by RAJA LAKSHMANAN on 07/04/24.
//

import Foundation

class AddUserInteractor: AddUserPresenterToInteractorProtocol {
    
    var presenter: AddUserInteractorToPresenterProtocol?
     
    // MARK: Post Method User Data Save To Api
    func addUserToApi(name: String, email: String, gender: String) {

        let dataRequest: [String: Any] = [
            "name": name,
            "email": email,
            "gender": gender,
            "status": "active"
        ]
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dataRequest)
            
            NetworkHandler.sharedHandler.startNetworkRequest(urlString: URLGenerator.UserApi, method: .methodTypePOST, headers: getHeaderBody(), body: jsonData) { result in
                switch result {
                case .success(let data):
                    do {
                        let jsonDecoder = JSONDecoder()
                        let userData = try jsonDecoder.decode(AddUserResponseObject.self, from: data)
                        self.presenter?.fetchDataSuccessfully(data: userData)
                        
                    } catch {
                        self.presenter?.apiCallFailedWithError(errorString: APIError.decodingError)
                    }
                case .failure(let error):
                    self.presenter?.apiCallFailedWithError(errorString:APIError.networkError(error))
                }
            }
        } catch {
            self.presenter?.apiCallFailedWithError(errorString: APIError.decodingError)
        }
    }
}
