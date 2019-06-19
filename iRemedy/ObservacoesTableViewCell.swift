//
//  ObservacoesTableViewCell.swift
//  iRemedy
//
//  Created by João Raffs on 17/06/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import UIKit

class ObservacoesTableViewCell: UITableViewCell {

    
    static var sintomasSelected: String = ""
    static var contraindicacaoSelected: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBOutlet weak var sintomasTextField: UITextField!
    @IBOutlet weak var contraindicacaoTextField: UITextField!
    
    @IBAction func contraindicacaoTextField(_ sender: Any) {
        if let chosenText = contraindicacaoTextField.text{
            ObservacoesTableViewCell.contraindicacaoSelected = chosenText
        }
    }
    
    @IBAction func sintomasTextField(_ sender: Any) {
        if let chosenText = sintomasTextField.text{
            ObservacoesTableViewCell.sintomasSelected = chosenText
        }
    }
    

}
