//
//  UserListPresenter.swift
//  UserDataTask
//
//  Created by RAJA LAKSHMANAN on 07/04/24.
//

import Foundation

class UserListPresenter: UserListViewToPresenterProtocol {
   
    private var _view: UserListPresenterToViewProtocol?
    private var _interactor: UserListPresenterToInteractorProtocol?
    private var _router: UserListPresenterToRouterProtocol?
    
    /*
     * Initializing Presenter
     * Input   :
     *          router    :- Presenter to router protocol that helps in Navigation
     *          view      :- Presenter to view protocol that helps to communicate with view
     *          interactor:- Presenter to interactor protocol that helps to execute bussiness logics
     */
    init(router: UserListPresenterToRouterProtocol, view: UserListPresenterToViewProtocol, interactor: UserListPresenterToInteractorProtocol) {
        _view = view
        _router = router
        _interactor = interactor
    }
    
    func moveToAddUserView() {
        _router?.moveToAddUserScreen(controller: AddUserRouter())
    }
    func fetchUserDataApi() {
        _interactor?.fetchUserDataApi()
    }
}

// MARK: Interactor To Presenter Protocol
extension UserListPresenter: UserListInteractorToPresenterProtocol {
    
    // MARK: Show Loader
    func showLoader() {
        _view?.showLoader()
    }
    
    // MARK: Hide Loader
    func hideLoader() {
        _view?.hideLoader()
    }
    
    // MARK: Api Error
    func apiCallFailedWithError(errorString: APIError) {
        _router?.showAlertPopup(with: errorString.errorMessage(), title: Constants.appName, successButtonTitle: Constants.AlertMessage.alertButtonOKTitle, successBlock: {isSuccess in
            
        })
    }
    
    // MARK: Api Success
    func fetchDataSuccessfully(data: [UserDataResponseObject]) {
        _view?.fetchDataSuccessfully(data: data)
    }
    
}
