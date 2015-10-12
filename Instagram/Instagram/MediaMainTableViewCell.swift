//
//  MediaMainTableViewCell.swift
//  Instagram
//
//  Created by Nadia Birouty on 10/11/15.
//  Copyright © 2015 Nadia Birouty. All rights reserved.
//

import UIKit

class MediaMainTableViewCell: UITableViewCell {

    @IBOutlet weak var mediaImage: UIImageView!
    
    @IBOutlet weak var mediaCaption: UITextField!
    
    @IBOutlet weak var numLikes: UITextField!
    
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
