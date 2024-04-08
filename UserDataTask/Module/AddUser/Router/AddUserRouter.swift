//
//  AddUserRouter.swift
//  UserDataTask
//
//  Created by RAJA LAKSHMANAN on 07/04/24.
//

import Foundation

final class AddUserRouter: BaseRouter {
    init() {
                
        let view = AddUserViewController(nibName: "AddUserViewController", bundle: nil)
        super.init(viewController: view)
        view.hidesBottomBarWhenPushed = true
        view.modalPresentationStyle = .fullScreen
        let interactor: AddUserPresenterToInteractorProtocol = AddUserInteractor()
        let router: AddUserPresenterToRouterProtocol = self
        let presenter: AddUserViewToPresenterProtocol & AddUserInteractorToPresenterProtocol = AddUserPresenter(router: router, view: view, interactor: interactor)
        view.presenter = presenter
        interactor.presenter = presenter
    }
}

// MARK: - Login Presenter To Router Protocol
extension AddUserRouter: AddUserPresenterToRouterProtocol {
 
    func pushToHomeScreen(controller: BaseRouter) {
        navigationController?.pushRouter(controller, animated: false)
    }
    func dismissCurrentView() {
        self.navigationController?.popViewController(animated: true)
    }
}
