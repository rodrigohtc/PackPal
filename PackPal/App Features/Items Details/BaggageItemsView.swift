//
//  BaggageItemsView.swift
//  PackPal
//
//  Created by Rodrigo Cavalcanti on 29/05/23.
//

import UIKit

class BaggageItemsView: UIView {
    let tableView: UITableView
    let addButton: UIButton
    let baggageLabel: UILabel

    override init(frame: CGRect) {
        tableView = UITableView()
        addButton = UIButton(type: .system)
        baggageLabel = UILabel()

        super.init(frame: frame)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50)
        ])

        addButton.setTitle("Add Item", for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(addButton)

        NSLayoutConstraint.activate([
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        baggageLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(baggageLabel)

        NSLayoutConstraint.activate([
            baggageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            baggageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            baggageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
