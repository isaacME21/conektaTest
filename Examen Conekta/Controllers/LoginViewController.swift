//
//  LoginViewController.swift
//  Examen Conekta
//
//  Created by Luis Isaac Maya on 31/03/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField : UITextField!
    @IBOutlet weak var passwordTextField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
    }
    
    private func hideKeyboard(){
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        tapGesture.cancelsTouchesInView = false
    }
    
    @IBAction func loginTapped(_ sender: UIButton)   {
        guard let email = emailTextField.text , let password = passwordTextField.text else{
            alerts(type: 0)
            return
        }
        
        if !email.isEmpty && !password.isEmpty{
            if !email.isValidEmail(){
                alerts(type: 2)
            }
            if !password.isValidPassword(){
               alerts(type: 3)
            }
            if email == "test@conekta.com" && password == "Abcd12345@"{
                let cardsVC = self.storyboard?.instantiateViewController(withIdentifier: "CardsViewController") as! CardsViewController
                navigationController?.pushViewController(cardsVC, animated: true)
            }else{
                alerts(type: 4)
            }
        }else{
            alerts(type: 1)
        }
    }
    
    private func alerts(type : Int)  {
        var title : String = ""
        var message : String = ""
        switch type {
        case 1:
            title = "Campos vacios"
            message = "Alguno de los campos esta vacio."
        case 2:
            title = "Email incorrecto"
            message = "Ingrese un email valido."
        case 3:
            title = "Contraseña incorrecto"
            message = "Ingrese una contraseña valida"
        case 4:
            title = "Cuenta no valida"
            message = "No existe la cuenta."
        default:
            title = "Error"
            message = "Error al obtener los datos ingresados."
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
        
    }

}
