//
//  Constants.swift
//  UserDataTask
//
//  Created by RAJA LAKSHMANAN on 06/04/24.
//

import Foundation
import UIKit

enum Constants {
    static let appName = "Disys-Task"
  
    enum AlertMessage {
        // Titles
        static let userData = "User Data"
        static let addUserData = "Add User Data"
        static let userDetails = "User Details"
        
        // Button Titles
        static let alertButtonOKTitle = "OK"
        static let cancel = "Cancel"
        
        // Error Messages
        static let alertMessageError = "Error!"
        static let alertMessageName = "Please enter your name"
        static let alertMessageInvalidEmail = "Please enter a valid email"
        static let alertMessageEmailEmpty = "Please enter your email"
        static let alertMessageNoDataFound = "No Data Found."
        static let alertMessageSaveFailed = "Save Failed"
        static let alertMessageSaveSuccess = "Saved Successful"
        static let alertMessageNewUser = "New User Added"
        static let serverError = "Internal server error, please try again after sometime."
        static let invalidURL = "The URL is not valid"
        
        // Other Messages
        static let english = "English"
    }
}
