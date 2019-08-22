//
//  ViewController.swift
//  PruebaVantis
//
//  Created by Mauricio Rodriguez on 8/22/19.
//  Copyright © 2019 Mauricio Rodriguez. All rights reserved.
//

import UIKit
import Alamofire

class LoginVC: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var passwordAux: String?
    var emailAux: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Alerta
    func alert(title: String, mesaje: String){
        let alert = UIAlertController(title: title, message: mesaje, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
            case .cancel:
                print("cancel")
            case .destructive:
                print("destructive")
            }}))
        self.present(alert, animated: true, completion: nil)
    }
    
    //Método para validar campos
    func validations () {
        
        guard let email = emailTextField?.text else {return}
        guard let password = passwordTextField?.text else {return}
        
        if email.isEmpty || !validateRegex(.user, email) {
            alert(title: "Error", mesaje: "Verifica el campo correo")
            
        } else if password.isEmpty {
            alert(title: "Error", mesaje: "Verifica el campo contraseña")
            
        } else {
            service()
            guard let viewCon = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as? ModulsVC else {return}
            
            navigationController?.pushViewController(viewCon, animated: true)
        }
    }
    
    
    //Método que llama a funcion regex
    func validateRegex(_ type: RegexType, _ stringToValidate: String) -> Bool {
        return  Utils.validateRegex(type: type, stringToValidate: stringToValidate)
    }
    
    //Método para tabular de un campo a otro
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
            
        case emailTextField:
            passwordTextField?.becomeFirstResponder()
        default:
            passwordTextField?.resignFirstResponder()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        validations()
        emailAux = emailTextField?.text ?? ""
        passwordAux = passwordTextField?.text ?? ""
        
    }

    //Conexión con el servicio
    func service() {
 
        let parameters = [
            "email": "admin@gmail.com",
            "password": "admin2019",
            ] as [String : Any]

        
        Alamofire.request("http://35.236.88.26:8035/api/Login/Authentication", method: .post, parameters: parameters, encoding: URLEncoding.default ).responseJSON {
            
            response in
            
            print(response.description)
            print(response.data)
            
            guard let dataRecieved = response.data else {
                print("no se pudo parsear la respuesta")
                return
            }
            
            print(dataRecieved)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {}
    override func viewDidAppear(_ animated: Bool) {}
    override func viewDidDisappear(_ animated: Bool) {}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

