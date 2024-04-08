//
//  UserListViewController.swift
//  UserDataTask
//
//  Created by RAJA LAKSHMANAN on 07/04/24.
//

import UIKit

class UserListViewController: BaseViewController {
    
    // MARK: Properties
    var presenter: UserListViewToPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    var dataArray = [UserDataResponseObject]()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.view.backgroundColor = .white        
        presenter?.fetchUserDataApi()
    }
    
    //MARK:- Register TableView
    func registerTableView()
    {
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(UINib.init(nibName: "UserListTableViewCell", bundle: nil), forCellReuseIdentifier: "userListTableViewCell")
    }
    
    //MARK:- Add User Action
    @IBAction func addUserAction(_ sender: Any) {
           presenter?.moveToAddUserView()
    }
    
}
//MARK:- UITable View Delegate and Datasource
extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "userListTableViewCell", for: indexPath) as? UserListTableViewCell{
            let getValue = dataArray[indexPath.row]
            cell.userData = getValue
            return cell
        }
        
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//MARK:- Presenter To View
extension UserListViewController: UserListPresenterToViewProtocol {
    
    //MARK:- Show Loader
    func showLoader() {
        self.showLoaderProgress()
    }
    
    //MARK:- Hide Loader
    func hideLoader() {
        self.dismissAlert()
    }
    
    //MARK:- Display Data
    func fetchDataSuccessfully(data: [UserDataResponseObject]) {
        dataArray = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
}
