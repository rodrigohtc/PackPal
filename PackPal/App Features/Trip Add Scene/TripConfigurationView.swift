//
//  TripConfigurationView.swift
//  PackPal
//
//  Created by Rodrigo on 21/05/23.
//

import UIKit

class TripConfigurationView: PacPalView {
    
    var destination: String? {
        return destinationTextField.text
    }
    
    var departureDate: Date {
        return departureDatePicker.date
    }
    
    var returnDate: Date {
        return returnDatePicker.date
    }
    
    var tripName: String? {
        return tripNameTextField.text
    }
    
    let tripConfigurationLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Configuração de Viagem"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    let tripNameTitleLabel: UILabel = {
        let titleLabel = UILabel(frame: CGRect(x: 50, y: 150, width: 200, height: 50))
        titleLabel.text = "Nome da viagem:"
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    let tripNameTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 50, y: 200, width: 200, height: 180))
        textField.placeholder = "Nome da viagem"
        textField.borderStyle = .roundedRect
        textField.borderStyle = .none
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        
        return textField
    }()
    
    let destinationTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Destino:"
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    let destinationTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 50, y: 200, width: 200, height: 180))
        textField.placeholder = "Nome da viagem"
        textField.borderStyle = .roundedRect
        textField.borderStyle = .none
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        
        return textField
    }()
    
    let departureLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Data de Partida:"
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    let departureDatePicker: UIDatePicker = {
        let dataPicker = UIDatePicker()
        dataPicker.datePickerMode = .date
        dataPicker.translatesAutoresizingMaskIntoConstraints = false
        
        return dataPicker
    }()
    
    let returnLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Data de Retorno:"
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    let returnDatePicker: UIDatePicker = {
        let dataPicker = UIDatePicker()
        dataPicker.datePickerMode = .date
        dataPicker.translatesAutoresizingMaskIntoConstraints = false
        
        return dataPicker
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Salvar", for: .normal)
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
    
    private func setupView() {
       
        let stackView = UIStackView(
            arrangedSubviews: [
                tripConfigurationLabel,
                tripNameTitleLabel,
                tripNameTextField,
                destinationTitleLabel,
                destinationTextField,
                departureLabel,
                departureDatePicker,
                returnLabel,
                returnDatePicker,
                saveButton])
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
