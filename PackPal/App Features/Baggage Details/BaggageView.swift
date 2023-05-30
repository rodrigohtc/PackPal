//
//  BaggageView.swift
//  PackPal
//
//  Created by Rodrigo Cavalcanti on 29/05/23.
//
import UIKit

class BaggageView: UIView {
    let tableView: UITableView
    let addButton: UIButton

    override init(frame: CGRect) {
        tableView = UITableView()
        addButton = UIButton(type: .system)

        super.init(frame: frame)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        addButton.setTitle("Add Baggage", for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(addButton)

        NSLayoutConstraint.activate([
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
