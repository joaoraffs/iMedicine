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
    
    internal init(nome: String, photo: UIImage, comprimidos: String, dosagem: String, horario: String) {
        
        self.nome = nome
        self.photo = photo
        self.dosagem = dosagem
        self.comprimidos = comprimidos
        self.horario = horario
    }
    
    var nome: String
    var photo: UIImage
    var dosagem: String
    var comprimidos: String
    var horario: String
}
