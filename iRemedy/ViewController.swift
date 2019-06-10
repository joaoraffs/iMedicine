//
//  ViewController.swift
//  iRemedy
//
//  Created by João Raffs on 08/06/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model.instance.remedios.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let remedio = Model.instance.remedios[indexPath.row]
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCollectionViewCell
        cell.horarioLabel.text = remedio.horario
        cell.nameLabel.text = remedio.nome
        cell.quantidadeLabel.text = remedio.comprimidos
        cell.remImageView.image = remedio.photo
        
        if remedio.contraindicacao == "ailton"{
            let imgName = "ailton.png"
            cell.remImageView.image = UIImage.init(named: imgName)
        }
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollectionView.delegate = self
        homeCollectionView.delegate = self
    }

    
}

