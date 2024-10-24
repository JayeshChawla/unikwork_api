//
//  UserTableViewCell.swift
//  Unikwor_Api
//
//  Created by Quick tech  on 24/10/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var companyname: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var hairType: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
