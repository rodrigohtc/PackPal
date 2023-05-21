//
//  TripSavedView.swift
//  PackPal
//
//  Created by Rodrigo on 21/05/23.
//

import UIKit

class TripSavedView: PacPalView {
    
    let successLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Viagem salva com sucesso!"
        textLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        textLabel.textAlignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
       
        return textLabel
    }()
    
    let nextTripsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Próximas Viagens", for: .normal)
        return button
    }()
    
    let customBagButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Adicionar Mala Personalizada", for: .normal)
        return button
    }()
    
    let goHomeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Ir para Home", for: .normal)
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
                successLabel,
                nextTripsButton,
                customBagButton,
                goHomeButton
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
