//
//  remedios.swift
//  iRemedy
//
//  Created by João Raffs on 12/06/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import Foundation
import UIKit
class HomeRemedio{
    
    internal init(nome: String?, photo: UIImage?, comprimidos: String?, dosagem: String?, horario: Date?, frequencia: Date?) {
        
        self.nome = nome
        self.photo = photo
        self.dosagem = dosagem
        self.comprimidos = comprimidos
        self.horario = horario
        self.frequencia = frequencia
    }
    
    var nome: String?
    var photo: UIImage?
    var dosagem: String?
    var comprimidos: String?
    var horario: Date?
    var frequencia: Date?
    
    public func hasPhoto() -> Bool{
        if photo == nil{
            return false
        }
        return true
    }
    
    func dateToHHmmString(date: Date) -> String{
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: date) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "HH:mm"
        // again convert your date to string
        let myStringafd = formatter.string(from: yourDate!)
        
        return myStringafd
    }
    
    public func dateToSeconds(date: Date) -> Int{
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: date) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "mm"
        // again convert your date to string
        let myStringafd = formatter.string(from: yourDate!)
        
        let asInt = Int(myStringafd)! * 60 + hoursToSeconds(date: date)
        
        return asInt
    }
    
    private func hoursToSeconds(date: Date) -> Int{
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: date) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "HH"
        // again convert your date to string
        let myStringafd = formatter.string(from: yourDate!)
        
        let asInt = Int(myStringafd)! * 3600
        
        return asInt
    }
    
}
