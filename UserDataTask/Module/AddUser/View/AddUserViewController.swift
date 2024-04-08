//
//  AddUserViewController.swift
//  UserDataTask
//
//  Created by RAJA LAKSHMANAN on 05/04/24.
//

import Foundation
import UIKit

class AddUserViewController: BaseViewController {
    
    @IBOutlet weak var nameTextField:UITextField!
    @IBOutlet weak var emailTextField:UITextField!
    @IBOutlet weak var genderSegment:UISegmentedControl!
    
    var genderString: String = "Male"
    var presenter: AddUserViewToPresenterProtocol?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = AppLanguage.shared.localizedString(for: "addUserData", value: Constants.AlertMessage.addUserData)
        hideKeyboardWhenTappedAround()
    }
    
    // MARK: Segment Index Changed
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        presenter?.didSelectGender(at: genderSegment.selectedSegmentIndex)
    }
    
    func setGenderString(_ genderString: String) {
            // Update UI or perform any other action with genderString
            self.genderString = genderString
            print("Selected gender: \(genderString)")
        }
    
    // MARK: Add User Action
    @IBAction func addUserAction(_ sender: Any) {
        presenter?.addUserToApi(name: nameTextField.text ?? "", email: emailTextField.text ?? "", gender: genderString)
    }
}

// MARK: UITextFieldDelegate
extension AddUserViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: Presennter To View Protocol
extension AddUserViewController: AddUserPresenterToViewProtocol {
    
    
}
