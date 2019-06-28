//
//  Model.swift
//  iRemedy
//
//  Created by João Raffs on 09/06/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import Foundation
import UIKit

class Model{
    
    private init(){}
    
    public static var instance = Model()
    
    public var allRemedios: [Remedio] = []
    
    public var homeRemedios: [HomeRemedio] = []
    

    
    
    public func savesHomeRemedioData(){
        var nomeArray: [String?] = []
        var photoArray: [String] = []
        var dosagemArray: [String?] = []
        var comprimidosArray: [String?] = []
        var horarioArray: [String] = []
        var frequenciaArray: [String] = []
        
        for remedio in homeRemedios{
            nomeArray.append(remedio.nome)
            dosagemArray.append(remedio.dosagem)
            comprimidosArray.append(remedio.comprimidos)
            if remedio.photo == nil{
                photoArray.append("")
            }else{
                photoArray.append(convertImageToBase64(image: remedio.photo!))
            }
            if remedio.frequencia == nil{
                frequenciaArray.append("")
            }else{
                frequenciaArray.append(remedio.dateToHHmmString(date: remedio.frequencia!))
            }
            if remedio.horario == nil{
                horarioArray.append("")
            }else{
                horarioArray.append(remedio.dateToHHmmString(date: remedio.horario!))
            }
            
        }
        let defaults = UserDefaults.standard
        defaults.set(nomeArray, forKey: "homeRemedioNomeArray")
        defaults.set(dosagemArray, forKey: "homeRemedioDosagemArray")
        defaults.set(comprimidosArray, forKey: "homeRemedioComprimidosArray")
        defaults.set(horarioArray, forKey: "homeRemedioHorarioArray")
        defaults.set(frequenciaArray, forKey: "homeRemedioFrequenciaArray")
        defaults.set(photoArray, forKey: "homeRemedioPhotoArray")
    }
    
    public func homeRemediosFromUserDefaults(){
        let defaults = UserDefaults.standard
        let nomeArray = defaults.stringArray(forKey: "homeRemedioNomeArray") ?? [String]()
        let dosagemArray = defaults.stringArray(forKey: "homeRemedioDosagemArray") ?? [String]()
        let comprimidosArray = defaults.stringArray(forKey: "homeRemedioComprimidosArray") ?? [String]()
        let horarioArray = defaults.stringArray(forKey: "homeRemedioHorarioArray") ?? [String]()
        let frequenciaArray = defaults.stringArray(forKey: "homeRemedioFrequenciaArray") ?? [String]()
        let photosArray = defaults.stringArray(forKey: "homeRemedioPhotoArray") ?? [String]()
        
        
        if nomeArray.count > 0{
            for i in 0..<nomeArray.count{
                let image = convertBase64ToImage(imageString: photosArray[0])
                let remedio: HomeRemedio = HomeRemedio(nome: nomeArray[i], photo: image, comprimidos: comprimidosArray[i], dosagem: dosagemArray[i], horario: stringToDate(string: horarioArray[i]), frequencia: stringToDate(string: frequenciaArray[i]))
                Model.instance.homeRemedios.append(remedio)
            }
        }
    }
    public func savesRemedioData(){
        var nomeArray: [String] = []
        var photoArray: [String] = []
        var dosagemArray: [String] = []
        var comprimidosArray: [String] = []
        var horarioArray: [String] = []
        var frequenciaArray: [String] = []
        var contraindicacaoArray: [String] = []
        var dataDeValidade: [String] = []
        var precoArray: [String] = []
        var sintomasArray: [String] = []
        var medidaArray: [String] = []
        var hasPhotoArray: [Bool] = []
        
        for remedio in allRemedios{
            nomeArray.append(remedio.nome)
            dosagemArray.append(remedio.dosagem)
            comprimidosArray.append(remedio.comprimidos)
            contraindicacaoArray.append(remedio.contraindicacao)
            precoArray.append(remedio.preco)
            sintomasArray.append(remedio.sintomas)
            medidaArray.append(remedio.medida)
            hasPhotoArray.append(remedio.hasPhoto)
            
            if remedio.horario == nil{
                horarioArray.append("")
            }else{
                horarioArray.append(dateToHHmmString(date: remedio.horario!))
            }
            if remedio.frequencia == nil{
                frequenciaArray.append("")
            }else{
                frequenciaArray.append(dateToHHmmString(date: remedio.frequencia!))
            }
            if remedio.photo == nil{
                photoArray.append("")
            }else{
                photoArray.append(convertImageToBase64(image: remedio.photo!))
            }
        }
        let defaults = UserDefaults.standard
        defaults.set(nomeArray, forKey: "allRemedioNomeArray")
        defaults.set(dosagemArray, forKey: "allRemedioDosagemArray")
        defaults.set(comprimidosArray, forKey: "allRemedioComprimidosArray")
        defaults.set(horarioArray, forKey: "allRemedioHorarioArray")
        defaults.set(frequenciaArray, forKey: "allRemedioFrequenciaArray")
        defaults.set(contraindicacaoArray, forKey: "allRemedioContraindicacaoArray")
        defaults.set(precoArray, forKey: "allRemedioPrecoArray")
        defaults.set(sintomasArray, forKey: "allRemedioSintomasArray")
        defaults.set(medidaArray, forKey: "allRemedioMedidaArray")
        defaults.set(hasPhotoArray, forKey: "allRemedioHasPhotoArray")
        defaults.set(photoArray, forKey: "homeRemedioPhotoArray")
        
    }
    
    public func allRemediosFromUserDefaults(){
        let defaults = UserDefaults.standard
        let nomeArray = defaults.stringArray(forKey: "allRemedioNomeArray") ?? [String]()
        let dosagemArray = defaults.stringArray(forKey: "allRemedioDosagemArray") ?? [String]()
        let comprimidosArray = defaults.stringArray(forKey: "allRemedioComprimidosArray") ?? [String]()
        let horarioArray = defaults.stringArray(forKey: "allRemedioHorarioArray") ?? [String]()
        let frequenciaArray = defaults.stringArray(forKey: "allRemedioFrequenciaArray") ?? [String]()
        let contraindicacaoArray = defaults.stringArray(forKey: "allRemedioContraindicacaoArray") ?? [String]()
        let precoArray = defaults.stringArray(forKey: "allRemedioPrecoArray") ?? [String]()
        let sintomasArray = defaults.stringArray(forKey: "allRemedioSintomasArray") ?? [String]()
        let medidaArray = defaults.stringArray(forKey: "allRemedioMedidaArray") ?? [String]()
        let hasPhotoArray: [Bool] = defaults.array(forKey: "allRemedioHasPhotoArray") as? [Bool] ?? [Bool]()
        let photosArray = defaults.stringArray(forKey: "homeRemedioPhotoArray") ?? [String]()
        
        for i in 0..<nomeArray.count{
            let remedio: Remedio = Remedio()
            remedio.comprimidos = comprimidosArray[i]
            remedio.nome = nomeArray[i]
            remedio.dosagem = dosagemArray[i]
            remedio.horario = stringToDate(string: horarioArray[i])
            remedio.frequencia = stringToDate(string: frequenciaArray[i])
            remedio.contraindicacao = contraindicacaoArray[i]
            remedio.preco = precoArray[i]
            remedio.sintomas = sintomasArray[i]
            remedio.medida = medidaArray[i]
            remedio.hasPhoto = hasPhotoArray[i]
            remedio.photo = convertBase64ToImage(imageString: photosArray[i])
            
            allRemedios.append(remedio)
        }
    }
    
    public func stringToDate(string: String) -> Date?{
        if string == ""{
            return nil
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let yourDate = formatter.date(from: string)
        return yourDate!
    }
    func dateToHHmmString(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: date)
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "HH:mm"
        let myStringafd = formatter.string(from: yourDate!)
        return myStringafd
    }
    
    func convertImageToBase64(image: UIImage?) -> String {
        if image == nil{
            return ""
        }
        let imageData = image!.pngData()!
        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }
    

    func convertBase64ToImage(imageString: String) -> UIImage? {
        if imageString == ""{
            return nil
        }
        let imageData = Data(base64Encoded: imageString, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
        return UIImage(data: imageData)!
    }
}
