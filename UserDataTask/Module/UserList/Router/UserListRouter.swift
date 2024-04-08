//
//  UserListRouter.swift
//  UserDataTask
//
//  Created by RAJA LAKSHMANAN on 07/04/24.
//

import Foundation

final class UserListRouter: BaseRouter {
    init() {
                
        let view = UserListViewController(nibName: "UserListViewController", bundle: nil)
        super.init(viewController: view)
        view.hidesBottomBarWhenPushed = true
        view.modalPresentationStyle = .fullScreen
        let interactor: UserListPresenterToInteractorProtocol = UserListInteractor()
        let router: UserListPresenterToRouterProtocol = self
        let presenter: UserListViewToPresenterProtocol & UserListInteractorToPresenterProtocol = UserListPresenter(router: router, view: view, interactor: interactor)
        view.presenter = presenter
        interactor.presenter = presenter
    }
}

// MARK: - Login Presenter To Router Protocol
extension UserListRouter: UserListPresenterToRouterProtocol {
    /*
     * Navigate to Add User Screen
     */
    func moveToAddUserScreen(controller: BaseRouter) {
        navigationController?.pushRouter(controller, animated: false)
    }
    
}
