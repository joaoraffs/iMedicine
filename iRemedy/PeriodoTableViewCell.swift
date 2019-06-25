//
//  HorarioTableViewCell.swift
//  iRemedy
//
//  Created by João Raffs on 17/06/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import UIKit

class PeriodoTableViewCell: UITableViewCell  {

    private var horarioSelected: Date = Date()
    private var frequenciaSelected: Date = Date()

    @IBOutlet weak var horarioPickerView: UIDatePicker!
    @IBOutlet weak var frequenciaDatePicker: UIDatePicker!
    
    @IBAction func frequenciaDatePicker(_ sender: Any) {
        
        frequenciaSelected = frequenciaDatePicker.date
    }
    
    @IBAction func horarioPicker(_ sender: Any) {
        horarioSelected = horarioPickerView.date
    }  
    
    public func getFrequenciaSelected() -> Date{
        return frequenciaSelected
    }
    public func getHorarioSelected() -> Date{
        return horarioSelected
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func periodoToString(){
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: frequenciaSelected) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "HH:mm"
        // again convert your date to string
        let myStringafd = formatter.string(from: yourDate!)
        
        print(myStringafd)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    
}
