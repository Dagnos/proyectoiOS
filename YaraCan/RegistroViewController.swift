//
//  RegistroViewController.swift
//  YaraCan
//
//  Created by Fernando Huarcaya Torres on 6/15/19.
//  Copyright © 2019 Fernando Huarcaya Torres. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegistroViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var contraseña: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func registrarTapped(_ sender: Any) {
        Auth.auth().createUser(withEmail: self.email.text!, password: self.contraseña.text!, completion: { (user, error ) in print("Intentando crear un usuario")
            if error != nil{
                print("Se presento el siguiente error al crear el usuario: \(error)")
            }else{
                print("El usuario fue creado exitosamente")
                
                let alerta = UIAlertController(title: "Creacion de Usuario", message: "Usuario \(self.email.text!) creado exitosamente.", preferredStyle: .alert)
                
                let btnOK = UIAlertAction(title: "Aceptar", style: .default, handler: { (UIAlertAction) in
                    self.performSegue(withIdentifier: "registroexitosoSegue", sender: nil)
                })
                alerta.addAction(btnOK)
                
                self.present(alerta, animated: true, completion: nil)
            }
        })
    }
    
    @IBAction func cancelarTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
