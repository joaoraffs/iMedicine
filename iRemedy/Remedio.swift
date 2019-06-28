//
//  Remedio.swift
//  iRemedy
//
//  Created by João Raffs on 09/06/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import Foundation
import UIKit

class Remedio{
    
    internal init() {
        nome = ""
        photo = nil
        dosagem = ""
        comprimidos = ""
        horario = nil
        frequencia = nil
        contraindicacao = ""
        dataDeValidade = nil
        preco = ""
        sintomas = ""
        medida = ""
        hasPhoto = false
    }
    
    var nome : String
    var photo: UIImage?
    var dosagem: String
    var comprimidos: String
    var horario: Date?
    var frequencia: Date?
    var contraindicacao: String
    var dataDeValidade: Date?
    var preco: String
    var sintomas: String
    var medida: String
    var hasPhoto: Bool
}
