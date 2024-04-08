//
//  UserListInteractor.swift
//  UserDataTask
//
//  Created by RAJA LAKSHMANAN on 07/04/24.
//

import Foundation

class UserListInteractor: UserListPresenterToInteractorProtocol {
    
    var presenter: UserListInteractorToPresenterProtocol?
    
    // MARK: Get Method User Data To Api
    func fetchUserDataApi() {
        self.presenter?.showLoader()
        NetworkHandler.sharedHandler.startNetworkRequest(urlString: URLGenerator.UserApi, method: .methodTypeGET, headers: getHeaderBody(), body: nil) { result in
            switch result {
            case .success(let data):
                do {
                    self.presenter?.hideLoader()
                    let jsonDecoder = JSONDecoder()
                    let userData = try jsonDecoder.decode(UsersModel.self, from: data)
                    self.presenter?.fetchDataSuccessfully(data: userData)

                } catch {
                    self.presenter?.hideLoader()
                    self.presenter?.apiCallFailedWithError(errorString: APIError.decodingError)
                }
            case .failure(let error):
                self.presenter?.hideLoader()
                self.presenter?.apiCallFailedWithError(errorString:APIError.networkError(error))
            }
        }
    }
}
