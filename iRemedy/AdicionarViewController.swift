//
//  AdicionarViewController.swift
//  iRemedy
//
//  Created by João Raffs on 09/06/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import UIKit

class AdicionarViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var cameraImageView: UIImageView!

    @IBOutlet weak var remedioNameTextField: UITextField!
    @IBOutlet weak var remedioComprimidosTextField: UITextField!
    @IBOutlet weak var remedioDosagemTextField: UITextField!
    @IBOutlet weak var remedioHorarioTextField: UITextField!
    @IBOutlet weak var remedioContraindicacoesTextField: UITextField!
    @IBOutlet weak var remedioDuranteTextField: UITextField!
    
    @IBAction func openCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        cameraImageView.image = image
        dismiss(animated:true, completion: nil)
    }
    
    
    @IBAction func adicionarRemedioButton(_ sender: Any) {
        let remedio: Remedio = Remedio()
        
        let nome = remedioNameTextField.text
        let image = cameraImageView.image
        let dosagem = remedioDosagemTextField.text
        let comprimidos = remedioComprimidosTextField.text
        let horario = remedioHorarioTextField.text
        let durante = remedioDuranteTextField.text
        let contraindicacoes = remedioContraindicacoesTextField.text
        
        if checkIfHasUso(dosagem: dosagem!, comprimidos: comprimidos!, horario: horario!, durante: durante!){
            
            print("entrou no if")
            
            let homeRemedio: HomeRemedio = HomeRemedio(nome: nome!, photo: image!, comprimidos: comprimidos!, dosagem: dosagem!, horario: horario!)
            
            
            Model.instance.homeRemedios.append(homeRemedio);
            
            
            print (Model.instance.homeRemedios)
        }
        
        remedio.nome = nome
        remedio.photo = image
        remedio.dosagem = dosagem
        remedio.comprimidos = comprimidos
        remedio.horario = horario
        remedio.durante = durante
        remedio.contraindicacao = contraindicacoes
        
        Model.instance.allRemedios.append(remedio)
        
        
    }
    
    public func callHomeViewController(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "homeViewController")
        present(vc!, animated: true)
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    private func checkIfHasUso(dosagem: String, comprimidos: String, horario: String, durante: String) -> Bool{
        
        print("entrou na funçaão")
        
        if !(dosagem.isEmpty && comprimidos.isEmpty && horario.isEmpty && durante.isEmpty){
            return true
            
        }
        return false
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    @IBAction func dismissKeyboard(_ sender: Any) {
         view.endEditing(true)
    }
    

}
