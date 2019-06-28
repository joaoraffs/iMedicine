//
//  RemedioTableViewCell.swift
//  iRemedy
//
//  Created by João Raffs on 27/06/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import UIKit

class RemedioTableViewCell: UITableViewCell {

    @IBOutlet weak var nomeDoRemedioLabel: UILabel!
    @IBOutlet weak var dosagemLabel: UILabel!
    @IBOutlet weak var dataDeValidadeLabel: UILabel!
    @IBOutlet weak var precoPagoLabel: UILabel!
    @IBOutlet weak var contraindicacoesLabel: UILabel!
    @IBOutlet weak var sintomasLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
