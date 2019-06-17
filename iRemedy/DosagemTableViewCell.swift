//
//  DosagemTableViewCell.swift
//  iRemedy
//
//  Created by João Raffs on 14/06/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import UIKit

class DosagemTableViewCell: UITableViewCell, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var dosagemTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    let medidasOptions: [String] = ["mg", "g", "µg"]
    var medidaEscolhida: String = ""
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return medidasOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return medidasOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        medidaEscolhida = medidasOptions[row]
    }
    
    public func getMedidaEscolhida() -> String{
        return medidaEscolhida
    }
    
    public func getDosagemEscolhida() -> String{
        
        if let dosagemEscolhida = dosagemTextField.text{
            return dosagemEscolhida
        }
        return ""
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        pickerView.delegate = self
        pickerView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    

}
