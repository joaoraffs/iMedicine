//
//  Model.swift
//  iRemedy
//
//  Created by João Raffs on 09/06/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import Foundation

class Model{
    
    private init(){}
    
    public static var instance = Model()
    
    public var allRemedios: [Remedio] = []
    
    public var homeRemedios: [HomeRemedio] = []
    
    
}
