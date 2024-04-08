//
//  BaseViewController.swift
//  UserDataTask
//
//  Created by RAJA LAKSHMANAN on 07/04/24.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    var titleLabel: UILabel?
    //MARK:- UIView Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        handleLocalization()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    func initView () {
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK:- Localization Handling
    func handleLocalization() {
        
    }
    
    //MARK:- Memory Warning Handling
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:- UIView Action
    
    func addBackBtnWithVCTitle(title: String){
        self.titleLabel?.text = title
    }
    
    @objc func backButtonaction() {
        if self.navigationController?.viewControllers.count ?? 0 > 1 {
            self.navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func dismissBackButtonAction() {
        self.dismiss(animated: true, completion: {
            self.navigationController?.popToRootViewController(animated: true)
        })
    }
}
