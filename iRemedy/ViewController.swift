//
//  ViewController.swift
//  iRemedy
//
//  Created by João Raffs on 08/06/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let notifications = ["Local Notification",
                         "Local Notification with Action",
                         "Local Notification with Content",
                         "Push Notification with  APNs",
                         "Push Notification with Firebase",
                         "Push Notification with Content"]
    
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    let DOSAGEM_SIZE_IN_LABELS = 3;
    let USO_SIZE_IN_LABELS = 2;
    let DETALHES_SIZE_IN_LABELS = 3;
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model.instance.homeRemedios.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let homeRemedio = Model.instance.homeRemedios[indexPath.row]
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCollectionViewCell
        cell.horarioLabel.text = homeRemedio.dateToHHmmString(date: homeRemedio.horario!)
        cell.nameLabel.text = homeRemedio.nome
        cell.quantidadeLabel.text = homeRemedio.comprimidos
        if homeRemedio.hasPhoto() == true{
            cell.remImageView.image = homeRemedio.photo
        }else{
            let image = UIImage(named: "Icon.png")
            cell.remImageView.image = image
        }
        return cell
    }
    
    func generatesArrayOfExistingData(remedio: Remedio) -> [String]{
        var numberOfProperValues: Int = 0;
        var arrayOfExistingData: [String] = []
        if !(remedio.dosagem == "") {
            arrayOfExistingData.append(remedio.dosagem)
            arrayOfExistingData.append(remedio.comprimidos)
            numberOfProperValues += DOSAGEM_SIZE_IN_LABELS
        }
        if !(remedio.contraindicacao == ""){
            arrayOfExistingData.append(remedio.contraindicacao);
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
        Model.instance.homeRemediosFromUserDefaults()
        Model.instance.allRemediosFromUserDefaults()
    }
    override func viewWillAppear(_ animated: Bool) {
        homeCollectionView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {

        
    }
}

