//
//  AddUserProtocol.swift
//  UserDataTask
//
//  Created by RAJA LAKSHMANAN on 07/04/24.
//

import Foundation

// MARK: - Presenter Protocol
protocol AddUserViewToPresenterProtocol: BasePresenterProtocal {
    func addUserToApi(name:String,email:String,gender:String)
    func didSelectGender(at index: Int)
}
// MARK: - View Protocol
protocol AddUserPresenterToViewProtocol: BaseViewProtocol {
    func setGenderString(_ genderString: String)
}

// MARK: - Interactor Protocol
protocol AddUserPresenterToInteractorProtocol: BaseInteractorProtocol {
    var presenter: AddUserInteractorToPresenterProtocol? { get set }
    func addUserToApi(name:String,email:String,gender:String)
}

// MARK: - Router Protocol
protocol AddUserPresenterToRouterProtocol: RouterProtocal {
    func dismissCurrentView()
}
// MARK: - Interactor To Presenter Protocol
protocol AddUserInteractorToPresenterProtocol: BaseInteractorToPresenterProtocol {
    func apiCallFailedWithError(errorString: APIError)
    func fetchDataSuccessfully(data: AddUserResponseObject)
}
