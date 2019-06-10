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
        
        remedio.nome = nome
        remedio.photo = image
        remedio.dosagem = dosagem
        remedio.comprimidos = comprimidos
        remedio.horario = horario
        remedio.durante = durante
        remedio.contraindicacao = contraindicacoes
        
        Model.instance.remedios.append(remedio)
        callHomeViewController()
        
    }
    
    public func callHomeViewController(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "homeViewController")
        present(vc!, animated: true)
        self.navigationController?.pushViewController(vc!, animated: true)
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
