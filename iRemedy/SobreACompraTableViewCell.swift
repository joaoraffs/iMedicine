//
//  SobreACompraTableViewCell.swift
//  iRemedy
//
//  Created by João Raffs on 17/06/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import UIKit

class SobreACompraTableViewCell: UITableViewCell {

    static var dataDeValidadeSelected: Date = Date()
    static var precoSelected: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBOutlet weak var dataDeValidadeDatePicker: UIDatePicker!
    @IBAction func dataDeValidadeDatePicker(_ sender: Any) {
        SobreACompraTableViewCell.dataDeValidadeSelected = dataDeValidadeDatePicker.date
    }
    
    @IBOutlet weak var precoTextField: UITextField!
    @IBAction func precoTextField(_ sender: Any) {
        if let chosenText = precoTextField.text{
            
            SobreACompraTableViewCell.precoSelected = chosenText
        }
    }
    
    
}
