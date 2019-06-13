//
//  NameTableViewCell.swift
//  iRemedy
//
//  Created by João Raffs on 13/06/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import UIKit

class NameTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        nameQuestionTitle.text = "Nome do remédio"
        nameQuestionSubtilte.text = "(maior nome escrito na caixa)"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameQuestionSubtilte: UILabel!
    @IBOutlet weak var nameQuestionTitle: UILabel!
}
