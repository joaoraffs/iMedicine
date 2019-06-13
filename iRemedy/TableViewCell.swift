//
//  TableViewCell.swift
//  iRemedy
//
//  Created by João Raffs on 13/06/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
}
