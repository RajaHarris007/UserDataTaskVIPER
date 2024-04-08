//
//  UserListTableViewCell.swift
//  UserDataTask
//
//  Created by RAJA LAKSHMANAN on 05/04/24.
//

import UIKit

class UserListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    var userData: UserDataResponseObject? {
        didSet {
            nameLabel.text = userData?.name ?? "Name not available"
            emailLabel.text = userData?.email ?? "Email not available"
            genderLabel.text = userData?.gender ?? "Gender not available"
            idLabel.text = "\(userData?.id ?? 0)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
