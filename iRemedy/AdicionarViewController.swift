//
//  AdicionarViewController.swift
//  iRemedy
//
//  Created by João Raffs on 09/06/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import UIKit

class AdicionarViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var nameTextField = UITextField()
    var cellIsOpened: [Bool] = []
    var medidaValue: String = "mg"
    var dosagemValue: String = ""
    var photoButton: UIButton = UIButton.init()
    
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
//        var remedio: Remedio = Remedio();
//
//        if let name = nameTextField.text{
//            remedio.nome = name
//        }
//        remedio.photo = cameraButton.imageView?.image
//        if cellIsOpened[1] == true{
//            remedio.dosagem ==
//        }
        
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
            
            photoButton = cell.cameraButton
            return cell
        }
        if cellIsOpened[indexPath.section] == true{
            if indexPath.row == 0{
                if  indexPath.section == 1 && indexPath.row == 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "DosagemTableViewCell", for: indexPath) as! DosagemTableViewCell
                    cell.transform = CGAffineTransform(rotationAngle: (-.pi))
                    return cell
                }
                if   indexPath.section == 2 && indexPath.row == 0{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "PeriodoTableViewCell", for: indexPath) as! PeriodoTableViewCell
                    cell.transform = CGAffineTransform(rotationAngle: (-.pi))
                    return cell
                }
                if  indexPath.section == 3 && indexPath.row == 0{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "SobreACompraTableViewCell", for: indexPath) as! SobreACompraTableViewCell
                    cell.transform = CGAffineTransform(rotationAngle: (-.pi))
                    return cell
                }
                if  indexPath.section == 4 && indexPath.row == 0{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ObservacoesTableViewCell", for: indexPath) as! ObservacoesTableViewCell
                    cell.transform = CGAffineTransform(rotationAngle: (-.pi))
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
        cellIsOpened[indexPath.section] = !cellIsOpened[indexPath.section]
        let section = IndexSet.init(integer: indexPath.section)
        tableView.reloadSections(section, with: .none)
        
    }

    @IBOutlet weak var tableView: UITableView!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        photoButton.setImage(image, for: .normal)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.transform = CGAffineTransform(rotationAngle: (-.pi))
        cellIsOpened.append(true)
        for _ in 0...4{
            cellIsOpened.append(false)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}
