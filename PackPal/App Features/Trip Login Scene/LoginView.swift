//
//  LoginView.swift
//  PackPal
//
//  Created by Rodrigo on 21/05/23.
//

import UIKit

class LoginView: PacPalView {
    let loginTitleLabel: UILabel = {
        let titleLabel = UILabel(frame: CGRect(x: 50, y: 150, width: 200, height: 50))
        titleLabel.text = "PackPal"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    let loginTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 50, y: 200, width: 200, height: 180))
        textField.placeholder = "Login"
        textField.borderStyle = .roundedRect
        textField.borderStyle = .none
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 50, y: 200, width: 200, height: 40))
        textField.borderStyle = .none
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.cornerRadius = 5
        textField.placeholder = "Senha"
        textField.isSecureTextEntry = true
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Criar Conta", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
        }
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupView()
        }
    
    func setupView() {
                
        let stackView = UIStackView(
            arrangedSubviews: [
                loginTitleLabel,
                loginTextField,
                passwordTextField,
                loginButton,
                registerButton
            ]
        )
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
