//
//  CommentsTableViewCell.swift
//  Instagram
//
//  Created by Nadia Birouty on 10/11/15.
//  Copyright © 2015 Nadia Birouty. All rights reserved.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {

    @IBOutlet weak var commentUser: UILabel!
    
    @IBOutlet weak var comment: UILabel!
    let numberOfSections = 2
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
