//
//  ObservacoesTableViewCell.swift
//  iRemedy
//
//  Created by João Raffs on 17/06/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import UIKit

class ObservacoesTableViewCell: UITableViewCell {

    
    private var sintomasSelected: String = ""
    private var contraindicacaoSelected: String = ""
    
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
        print("entrou no contra")
        if let chosenText = contraindicacaoTextField.text{
            contraindicacaoSelected = chosenText
        }else{
            contraindicacaoSelected = ""
        }
    }
    @IBAction func sintomasTextField(_ sender: Any) {
        print("entrou no sint")
        if let chosenText = sintomasTextField.text{
            sintomasSelected = chosenText
        }else{
            sintomasSelected = ""
        }
    }
    
    public func getSintomasSelected() -> String{
        return sintomasSelected
    }
    public func getContraindicacoesSelected() -> String{
        return contraindicacaoSelected
    }
    

}
