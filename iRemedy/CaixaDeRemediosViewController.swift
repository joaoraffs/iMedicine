//
//  CaixaDeRemediosViewController.swift
//  iRemedy
//
//  Created by João Raffs on 27/06/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import UIKit

class CaixaDeRemediosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.instance.allRemedios.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RemedioTableViewCell", for: indexPath) as! RemedioTableViewCell
        let remedio = Model.instance.allRemedios[indexPath.row]
        let dosagemText = " " + remedio.dosagem + " " + remedio.medida
        cell.nomeDoRemedioLabel.text = remedio.nome
        cell.contraindicacoesLabel.text = cell.contraindicacoesLabel.text! + " " + remedio.contraindicacao
        cell.precoPagoLabel.text = cell.precoPagoLabel.text! + " " + remedio.preco
        cell.contraindicacoesLabel.text = cell.contraindicacoesLabel.text! + " " + remedio.contraindicacao
        cell.dosagemLabel.text = cell.dosagemLabel.text! + dosagemText
        cell.sintomasLabel.text = cell.sintomasLabel.text! + " " + remedio.sintomas
        if remedio.hasPhoto{
            cell.photoImageView.image = remedio.photo
        }
        if let dataDeValidade = remedio.dataDeValidade {
            cell.dataDeValidadeLabel.text = " " + Model.instance.dateToHHmmString(date: dataDeValidade)
        }
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    @IBOutlet weak var tableView: UITableView!
}
