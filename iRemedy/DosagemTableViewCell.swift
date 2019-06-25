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
    @IBOutlet weak var comprimidosStepper: UIStepper!
    @IBOutlet weak var numeroDeComprimidosLabel: UILabel!
    
    let medidasOptions: [String] = ["mg", "g", "µg"]
    static var medidasSelected: String = ""
    static var dosagemSelected: String = ""
    static var comprimidosSelected: Int = 0
    
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
        DosagemTableViewCell.medidasSelected = medidasOptions[row]
    }
    
    public func getMedidaEscolhida() -> String{
        return DosagemTableViewCell.medidasSelected
    }

    @IBAction func dosagemTextField(_ sender: Any) {
        print("entrou no dosagem")
        if let dosagem = dosagemTextField.text{
            DosagemTableViewCell.dosagemSelected = dosagem
        }
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
    
    @IBAction func stepperPressed(_ sender: Any) {
        DosagemTableViewCell.comprimidosSelected = Int(comprimidosStepper.value)
        numeroDeComprimidosLabel.text = String(DosagemTableViewCell.comprimidosSelected)
    }
    
    

}
