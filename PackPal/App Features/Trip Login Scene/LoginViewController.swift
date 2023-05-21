//
//  LoginViewController.swift
//  PackPal
//
//  Created by Rodrigo on 21/05/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var loginView = LoginView()
    
    override func loadView() {
        super.loadView()
        view = loginView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
        
    @objc func loginButtonTapped() {
        guard let login = loginView.loginTextField.text,
              let password = loginView.passwordTextField.text else {
            return
        }
        
        if login == "Rhtc" && password == "1234" {
            let homeViewController = HomeViewController()
            navigationController?.pushViewController(homeViewController, animated: true)
        } else {
            let alert = UIAlertController(title: "Login ou senha incorretos", message: "Por favor, verifique suas informações", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func registerButtonTapped() {
        
    }
}
