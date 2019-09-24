//
//  AdicionarViewController.swift
//  iRemedy
//
//  Created by João Raffs on 09/06/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import UIKit
import UserNotifications

class AdicionarViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource{
    
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
 
    var cell0: NameTableViewCell = NameTableViewCell()
    var cell1: DosagemTableViewCell = DosagemTableViewCell()
    var cell2: PeriodoTableViewCell = PeriodoTableViewCell()
    var cell3: SobreACompraTableViewCell = SobreACompraTableViewCell()
    var cell4: ObservacoesTableViewCell = ObservacoesTableViewCell()
    
    var nameTextField = UITextField()
    var cellIsOpened: [Bool] = []
    
    var keyboardIsShown: Bool = false
    
    var medidaValue: String = "mg"
    var dosagemValue: String = ""
    var comprimidosValue: Int = 0
    var frequenciaValue: Date = Date()
    var horarioValue: Date = Date()
    var dataDeValidadeValue: Date = Date()
    var precoValue: String = ""
    var sintomasValue: String = ""
    var contraindicacaoValue: String = ""
    
    var userSettedPhoto: Bool = false
    var photoButton: UIButton = UIButton.init()
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cellIsOpened[section] == true && section != 0{
            return 2;
        }else{
            return 1;
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    @IBAction func adicionarRemedioButton(_ sender: Any) {
        let remedio: Remedio = Remedio()
        if let nome = cell0.nameTextField.text{
            remedio.nome = nome
            if userSettedPhoto == true{
                let cell = cell0
                remedio.photo = cell.cameraButton.imageView?.image
                remedio.hasPhoto = true
            }else{
                remedio.photo = nil
            }
            if cellIsOpened[1] == true{
                let cell = cell1
                if let dosagem = cell.dosagemTextField.text{
                    dosagemValue =  dosagem
                }
                remedio.dosagem = dosagemValue
                remedio.comprimidos = String(cell.comprimidosStepper.value)
                remedio.medida = cell.getMedidaEscolhida()
            }
            if cellIsOpened[2] == true{
                let cell = cell2
                
                remedio.frequencia = cell.getFrequenciaSelected()
                remedio.horario = cell.getHorarioSelected()
                
                cell.periodoToString()
                
                let homeRemedio = HomeRemedio(nome: remedio.nome, photo: remedio.photo, comprimidos: remedio.comprimidos, dosagem: remedio.dosagem, horario: remedio.horario, frequencia: remedio.frequencia)

                print(homeRemedio.dateToSeconds(date: remedio.frequencia!))
                
                homeRemedio.setHomeRemedio()
                Model.instance.savesHomeRemedioData()
            }
            if cellIsOpened[3] == true{
                let cell = cell3
                remedio.dataDeValidade = cell.getDataDeValidadeSelected()
                remedio.preco = cell.precoTextField.text!
            }
            
            if cellIsOpened[4] == true{
                let cell = cell4
                remedio.sintomas = cell.sintomasTextField.text!
                remedio.contraindicacao = cell.contraindicacaoTextField.text!
            }
            Model.instance.allRemedios.append(remedio)
            Model.instance.savesRemedioData()
        }
    }
    
    private func callFillDetails(){
        print("fill the details")
    }
    
    @IBAction func cameraButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath) as! NameTableViewCell
            cell.transform = CGAffineTransform(rotationAngle: (-.pi))
            cell.nameTextField.text = nil

            cell0 = cell
            return cell
        }
        
        if cellIsOpened[indexPath.section] == true{
            if indexPath.row == 0{
                if  indexPath.section == 1 && indexPath.row == 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "DosagemTableViewCell", for: indexPath) as! DosagemTableViewCell
                    cell.transform = CGAffineTransform(rotationAngle: (-.pi))
                    
                    cell1 = cell
                    return cell
                }
                if   indexPath.section == 2 && indexPath.row == 0{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "PeriodoTableViewCell", for: indexPath) as! PeriodoTableViewCell
                    cell.transform = CGAffineTransform(rotationAngle: (-.pi))
                    
                    cell2 = cell
                    return cell
                }
                if  indexPath.section == 3 && indexPath.row == 0{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "SobreACompraTableViewCell", for: indexPath) as! SobreACompraTableViewCell
                    cell.transform = CGAffineTransform(rotationAngle: (-.pi))
                    
                    cell3 = cell
                    return cell
                }
                if  indexPath.section == 4 && indexPath.row == 0{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ObservacoesTableViewCell", for: indexPath) as! ObservacoesTableViewCell
                    cell.transform = CGAffineTransform(rotationAngle: (-.pi))
                    
                    cell4 = cell
                    return cell
                }
            }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "expansibleCell", for: indexPath) as! TableViewCell
        let newImage = UIImage(named: "expansible\(indexPath.section)")
        cell.backgroundImageView?.image = newImage
        cell.backgroundImageView?.contentMode = .topLeft
        cell.backgroundImageView?.clipsToBounds = true
        cell.transform = CGAffineTransform(rotationAngle: (-.pi))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 260
        }
        if cellIsOpened[indexPath.section] == true{
            if indexPath.row == 0{
                if indexPath.section == 1 || indexPath.section == 2{
                    return 123
                }
                if indexPath.section == 3{
                    return 203
                }
                if indexPath.section == 4{
                    return 214
                }
            }else{
                return 80;
            }
        } else if indexPath.row == 0{
            return 80
        }
        return 0;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if keyboardIsShown {
            view.endEditing(true)
            keyboardIsShown = false
            return
        }
        if indexPath.section != 0{
            cellIsOpened[indexPath.section] = !cellIsOpened[indexPath.section]
            let section = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section, with: .none)
        }
    }

    @IBOutlet weak var tableView: UITableView!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        cell0.cameraButton.setImage(image, for: .normal)
        userSettedPhoto = true
        dismiss(animated:true, completion: nil)
    }
    
    
    public func callHomeViewController(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "homeViewController")
        present(vc!, animated: true)
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    private func checkIfHasUso(dosagem: String, comprimidos: String, horario: String, durante: String) -> Bool{
        if !(dosagem.isEmpty && comprimidos.isEmpty && horario.isEmpty && durante.isEmpty){
            return true
        }
        return false
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        tableView.transform = CGAffineTransform(rotationAngle: (-.pi))

        cellIsOpened.append(true)
        for _ in 0...4{
            cellIsOpened.append(false)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func keyboardWillAppear(notification: NSNotification) {
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else{
            return
        }
        
        keyboardIsShown = true
        bottomConstraint.constant = keyboardRect.height + 45
        view.layoutIfNeeded()
        print(keyboardIsShown)
    }
    
    @objc func keyboardWillDisappear() {
        keyboardIsShown = false
        bottomConstraint.constant = 45
        view.layoutIfNeeded()
        print(keyboardIsShown)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}
