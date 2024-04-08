//
//  UserListProtocol.swift
//  UserDataTask
//
//  Created by RAJA LAKSHMANAN on 07/04/24.
//

import Foundation

// MARK: - Presenter Protocol
protocol UserListViewToPresenterProtocol: BasePresenterProtocal {
    func fetchUserDataApi()
    func moveToAddUserView()
}

// MARK: - View Protocol
protocol UserListPresenterToViewProtocol: BaseViewProtocol {
    func fetchDataSuccessfully(data: [UserDataResponseObject])
    func showLoader()
    func hideLoader()
}

// MARK: - Interactor Protocol
protocol UserListPresenterToInteractorProtocol: BaseInteractorProtocol {
    var presenter: UserListInteractorToPresenterProtocol? { get set }
    func fetchUserDataApi()
}

// MARK: - Router Protocol
protocol UserListPresenterToRouterProtocol: RouterProtocal {
    func moveToAddUserScreen(controller: BaseRouter)
}

// MARK: - Interactor To Presenter Protocol
protocol UserListInteractorToPresenterProtocol: BaseInteractorToPresenterProtocol {
    func apiCallFailedWithError(errorString: APIError)
    func fetchDataSuccessfully(data: [UserDataResponseObject])
    func showLoader()
    func hideLoader()
}
