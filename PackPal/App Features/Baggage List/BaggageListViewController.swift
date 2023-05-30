//
//  BaggageListViewController.swift
//  PackPal
//
//  Created by Rodrigo Cavalcanti on 29/05/23.
//

import UIKit

class BaggageListViewController: UIViewController {
    private let baggageListView = BaggageListView()
    private let dataManager = DataManager.shared
    private var baggageList: [Baggage] = []

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = baggageListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Baggage List"

        baggageListView.tableView.delegate = self
        baggageListView.tableView.dataSource = self
        baggageListView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        baggageListView.addButton.addTarget(self, action: #selector(addBaggage), for: .touchUpInside)

        reloadTableData()
    }

    private func reloadTableData() {
        baggageListView.tableView.reloadData()
    }

    @objc private func addBaggage() {
        let alertController = UIAlertController(title: "Add Baggage", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Baggage Name"
        }
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            if let baggageName = alertController.textFields?.first?.text {
                let baggage = Baggage(id: UUID(), name: baggageName, items: [])
                self.baggageList.append(baggage)
                DataManager.shared.saveBaggage(baggage)
                self.reloadTableData()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
}

extension BaggageListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baggageList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let baggage = baggageList[indexPath.row]
        cell.textLabel?.text = baggage.name
        return cell
    }
}

class BaggageListView: UIView {
    let tableView: UITableView
    let addButton: UIButton

    override init(frame: CGRect) {
        tableView = UITableView()
        addButton = UIButton(type: .system)
        super.init(frame: frame)

        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = .white

        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: addButton.topAnchor)
        ])

        addButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(addButton)

        NSLayoutConstraint.activate([
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        tableView.tableFooterView = UIView()
    }
}
