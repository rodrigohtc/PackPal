//
//  BaggageItemsViewController.swift
//  PackPal
//
//  Created by Rodrigo Cavalcanti on 29/05/23.
//

import UIKit

class BaggageItemsViewController: UIViewController {
    private let baggageItemsView = BaggageItemsView()
    private var baggage: Baggage?

    init(baggage: Baggage?) {
        self.baggage = baggage
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = baggageItemsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Baggage Items"

        baggageItemsView.tableView.delegate = self
        baggageItemsView.tableView.dataSource = self
        baggageItemsView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BaggageItemCell")

        baggageItemsView.addButton.addTarget(self, action: #selector(addItemButtonTapped), for: .touchUpInside)

        baggageItemsView.baggageLabel.text = baggage?.name

        loadItems()
    }

    private func loadItems() {
        // Aqui você carrega os itens da bagagem da memória do dispositivo (ou de qualquer outra fonte de dados)
        // Por enquanto, vamos adicionar alguns itens de exemplo
        baggage?.items = ["Item 1", "Item 2", "Item 3"]

        baggageItemsView.tableView.reloadData()
    }

    @objc private func addItemButtonTapped() {
        // Aqui você pode exibir um formulário ou uma tela de criação de item
        // Por enquanto, vamos adicionar um item vazio diretamente
        let newItem = "Novo Item"
        baggage?.items.append(newItem)

        saveItems()

        baggageItemsView.tableView.reloadData()
    }

    private func saveItems() {
//        do {
//            let data = try JSONEncoder().encode(baggage.items)
//            let itemsURL = Baggage.archiveURL.appendingPathComponent("\(baggage.name)_items.json")
//            try data.write(to: itemsURL)
//        } catch {
//            print("Failed to save baggage items: \(error)")
//        }
    }
}

extension BaggageItemsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baggage?.items.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BaggageItemCell", for: indexPath)
        let item = baggage?.items[indexPath.row]
        cell.textLabel?.text = item
        return cell
    }
}
