//
//  HomeView.swift
//  PackPal
//
//  Created by Rodrigo on 21/05/23.
//

import UIKit

class HomeView: PacPalView {
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Adicionar Viagem", for: .normal)
        return button
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

    let baggageList: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Lista de Bagagens", for: .normal)
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
                addButton,
                nextTripsButton,
                customBagButton,
                baggageList
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
