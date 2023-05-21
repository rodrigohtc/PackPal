//
//  TripDetailsView.swift
//  PackPal
//
//  Created by Rodrigo on 21/05/23.
//

import UIKit

class TripDetailsView: PacPalView {
  
    let tripDetailsLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    let editButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Editar Viagem", for: .normal)
        
        return button
    }()

    let addBagsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Adicionar Malas", for: .normal)
        
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView () {
        let stackView = UIStackView(
            arrangedSubviews: [
                tripDetailsLabel,
                editButton,
                addBagsButton
                ])
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
