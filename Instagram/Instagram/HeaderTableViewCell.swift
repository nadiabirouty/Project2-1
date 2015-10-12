//
//  HeaderTableViewCell.swift
//  Instagram
//
//  Created by Nadia Birouty on 10/11/15.
//  Copyright © 2015 Nadia Birouty. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var profileUserName: UITextField!
    @IBOutlet weak var date: UITextField!
    let numberOfSections = 3
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
