//
//  SobreACompraTableViewCell.swift
//  iRemedy
//
//  Created by João Raffs on 17/06/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import UIKit

class SobreACompraTableViewCell: UITableViewCell {

    private var dataDeValidadeSelected: Date = Date()

    
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
        dataDeValidadeSelected = dataDeValidadeDatePicker.date
    }
    
    @IBOutlet weak var precoTextField: UITextField!
    @IBAction func precoTextField(_ sender: Any) {

    }
    
    public func getDataDeValidadeSelected() -> Date{
        return dataDeValidadeSelected
    }
    
    public func getPrecoSelected() -> String{
        if let preco = precoTextField.text{
            return preco
        }
        return ""
    }
    
}
