//
//  HorarioTableViewCell.swift
//  iRemedy
//
//  Created by João Raffs on 17/06/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import UIKit

class PeriodoTableViewCell: UITableViewCell  {

    static var horarioSelected: Date = Date()
    static var frequenciaSelected: Date = Date()

    @IBOutlet weak var horarioPickerView: UIDatePicker!
    @IBOutlet weak var frequenciaDatePicker: UIDatePicker!
    
    @IBAction func frequenciaDatePicker(_ sender: Any) {
        
        PeriodoTableViewCell.frequenciaSelected = frequenciaDatePicker.date
    }
    
    @IBAction func horarioPicker(_ sender: Any) {
        
        PeriodoTableViewCell.horarioSelected = horarioPickerView.date
        
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()

        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    
}
