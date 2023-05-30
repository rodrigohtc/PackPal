//
//  TripListView.swift
//  PackPal
//
//  Created by Rodrigo on 21/05/23.
//

import UIKit

class TripListView: PacPalView {
    
     lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

     lazy var addTripButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add Trip", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
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
        backgroundColor = .white

        addSubview(tableView)
        addSubview(addTripButton)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        addTripButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            addTripButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            addTripButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            addTripButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            addTripButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
