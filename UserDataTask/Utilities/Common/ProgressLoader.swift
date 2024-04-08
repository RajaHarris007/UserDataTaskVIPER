//
//  ProgressLoader.swift
//  UserDataTask
//
//  Created by RAJA LAKSHMANAN on 06/04/24.
//

import Foundation
import UIKit

extension UIViewController {
    private var loaderAlertController: UIAlertController? {
        return presentedViewController as? UIAlertController
    }

    func showLoaderProgress(completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: nil, message: "Please wait\n\n", preferredStyle: .alert)
        let spinnerIndicator = UIActivityIndicatorView(style: .medium)
        spinnerIndicator.center = CGPoint(x: 135.0, y: 65.5)
        spinnerIndicator.color = UIColor.black
        spinnerIndicator.startAnimating()
        alertController.view.addSubview(spinnerIndicator)
        
        DispatchQueue.main.async {
            self.present(alertController, animated: false, completion: completion)
        }
    }
    
    func dismissAlert() {
        DispatchQueue.main.async {
            self.loaderAlertController?.dismiss(animated: true, completion: nil)
        }
    }
}
