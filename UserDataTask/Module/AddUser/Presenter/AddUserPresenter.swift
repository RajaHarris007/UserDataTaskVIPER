//
//  AddUserPresenter.swift
//  UserDataTask
//
//  Created by RAJA LAKSHMANAN on 07/04/24.
//

import Foundation

class AddUserPresenter: AddUserViewToPresenterProtocol {
   
     private var _view: AddUserPresenterToViewProtocol?
     private var _interactor: AddUserPresenterToInteractorProtocol?
     private var _router: AddUserPresenterToRouterProtocol?
    
    /*
     * Initializing Presenter
     * Input   :
     *          router    :- Presenter to router protocol that helps in Navigation
     *          view      :- Presenter to view protocol that helps to communicate with view
     *          interactor:- Presenter to interactor protocol that helps to execute bussiness logics
     */
    init(router: AddUserPresenterToRouterProtocol, view: AddUserPresenterToViewProtocol, interactor: AddUserPresenterToInteractorProtocol) {
        _view = view
        _router = router
        _interactor = interactor
    }
    
    // MARK: Segment did Selection
    func didSelectGender(at index: Int) {
            switch index {
            case 0:
                _view?.setGenderString("Male")
            case 1:
                _view?.setGenderString("Female")
            default:
                break
            }
        }
    
    func addUserToApi(name: String, email: String, gender: String) {
        let validation = validateInputs(name: name, email: email)
        if !validation.isValid {
            _router?.showAlertPopup(with: validation.errorMessage ?? "Unknown Error", title: Constants.appName, successButtonTitle: Constants.AlertMessage.alertButtonOKTitle, successBlock: {isSuccess in
                
            })
        }else{
            _interactor?.addUserToApi(name: name, email: email, gender: gender)
        }
    }
}

// MARK: Inputs Validation
extension AddUserPresenter {
    
    func validateInputs(name: String, email: String) -> (isValid: Bool, errorMessage: String?) {
        
        // Check if name is empty or contains only whitespace characters
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return (false, Constants.AlertMessage.alertMessageName)
            
            // Check if email is empty or contains only whitespace characters
        } else if email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return (false, Constants.AlertMessage.alertMessageEmailEmpty)
            
            // Check if email is in valid format
        } else if !email.isValidEmail() {
            return (false, Constants.AlertMessage.alertMessageInvalidEmail)
        } else {
            return (true, nil)
        }
    }
}

// MARK: Interactor To Presenter Protocol
extension AddUserPresenter: AddUserInteractorToPresenterProtocol {
    
    // MARK: Api Error
    func apiCallFailedWithError(errorString: APIError) {
        _router?.showAlertPopup(with: errorString.errorMessage(), title: Constants.appName, successButtonTitle: Constants.AlertMessage.alertButtonOKTitle, successBlock: {isSuccess in
            
        })
    }
    
    // MARK: Api Success
    func fetchDataSuccessfully(data: AddUserResponseObject) {
        _router?.showAlertPopup(with: Constants.AlertMessage.alertMessageSaveSuccess, title: Constants.appName, successButtonTitle: Constants.AlertMessage.alertButtonOKTitle, successBlock: {isSuccess in
            self._router?.dismissCurrentView()
        })
    }
    
}
