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
    
    let DOSAGEM_SIZE_IN_LABELS = 3;
    let USO_SIZE_IN_LABELS = 2;
    let DETALHES_SIZE_IN_LABELS = 3;
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model.instance.homeRemedios.count
    }
    
    @IBAction func adicionarRemedioButton(_ sender: Any) {
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let remedio = Model.instance.homeRemedios[indexPath.row]
        
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCollectionViewCell
        
        print(remedio)
        
        cell.horarioLabel.text = remedio.horario
        cell.nameLabel.text = remedio.nome
        cell.quantidadeLabel.text = remedio.comprimidos
        cell.remImageView.image = remedio.photo
        
        return cell
    }
    
    func generatesArrayOfExistingData(remedio: Remedio) -> [String]{
    
        var numberOfProperValues: Int = 0;
        var arrayOfExistingData: [String] = []
        
        if !(remedio.dosagem == nil) {
            arrayOfExistingData.append(remedio.dosagem!);
            arrayOfExistingData.append(remedio.comprimidos!);
//            arrayOfExistingData.append(
            numberOfProperValues += DOSAGEM_SIZE_IN_LABELS;
        }
        
        if !(remedio.durante == nil){
            arrayOfExistingData.append(remedio.horario!);
            arrayOfExistingData.append(remedio.durante!);
            
            numberOfProperValues += USO_SIZE_IN_LABELS;
        }
        
        if !(remedio.contraindicacao == nil){
            arrayOfExistingData.append(remedio.contraindicacao!);
//            arrayOfExistingData.append(remedio.observacao!);
//            arrayOfExistingData.append(remedio.sintoma!)
            
            numberOfProperValues += DETALHES_SIZE_IN_LABELS;
        }
        
        if numberOfProperValues != 0{
            return arrayOfExistingData
        }else{
            return []
        }
    }
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollectionView.delegate = self
        homeCollectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homeCollectionView.reloadData()
    }

    
}

