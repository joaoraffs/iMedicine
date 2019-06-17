//
//  AdicionarViewController.swift
//  iRemedy
//
//  Created by João Raffs on 09/06/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import UIKit

class AdicionarViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource  {
    

    
    var nameTextField = UITextField()
    var cellIsOpened: [Bool] = []
    
    var medidaValue: String = "mg"
    var dosagemValue: String = ""

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    var finalButton: UIButton = UIButton()
    
    @IBAction func adicionarRemedioButton(_ sender: Any) {
        print(PeriodoTableViewCell.horarioSelected)
    }
    
    @IBAction func cameraButton(_ sender: Any) {

        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath) as! NameTableViewCell
            
            self.finalButton = cell.cameraButton
            self.nameTextField = cell.nameTextField
            
            cell.transform = CGAffineTransform(rotationAngle: (-.pi))
            
            return cell
        }
        
        if indexPath.row == 1{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DosagemTableViewCell", for: indexPath) as! DosagemTableViewCell
            
            cell.transform = CGAffineTransform(rotationAngle: (-.pi))
            
            return cell
            
        }
        
        if indexPath.row == 2{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PeriodoTableViewCell", for: indexPath) as! PeriodoTableViewCell
            
            cell.transform = CGAffineTransform(rotationAngle: (-.pi))
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "expansibleCell", for: indexPath) as! TableViewCell
        
        let newImage = UIImage(named: "expansible\(indexPath.row)")
        
        cell.backgroundImageView?.image = newImage
        cell.backgroundImageView?.contentMode = .topLeft
        cell.backgroundImageView?.clipsToBounds = true
        
        cell.transform = CGAffineTransform(rotationAngle: (-.pi))
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0{
            return 260
        }
        
        return 80
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath){
        
        self.cellIsOpened[indexPath.row] = !cellIsOpened[indexPath.row]
        tableView.reloadData()
        
    }

    @IBOutlet weak var tableView: UITableView!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        finalButton.setImage(image, for: .normal)
        
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
    
    @IBAction func dismissKeyboard(_ sender: Any) {
         view.endEditing(true)
    }
    

}
