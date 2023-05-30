//
//  BaggageViewController.swift
//  PackPal
//
//  Created by Rodrigo Cavalcanti on 29/05/23.
//

import UIKit

class BaggageViewController: UIViewController {
    private let baggageView = BaggageView()
    private var baggages: [Baggage] = []

    override func loadView() {
        view = baggageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Baggages"


        baggageView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BaggageCell")

        baggageView.addButton.addTarget(self, action: #selector(addBaggageButtonTapped), for: .touchUpInside)

        loadBaggages()
    }

    private func loadBaggages() {
        // Aqui você carrega as bagagens da memória do dispositivo (ou de qualquer outra fonte de dados)
        // Por enquanto, vamos adicionar algumas bagagens de exemplo
        let baggage1 = Baggage(name: "Bagagem 1", items: [])
        let baggage2 = Baggage(name: "Bagagem 2", items: [])
        baggages = [baggage1, baggage2]

        baggageView.tableView.reloadData()
    }

    @objc private func addBaggageButtonTapped() {
        // Aqui você pode exibir um formulário ou uma tela de criação de bagagem
        // Por enquanto, vamos adicionar uma bagagem vazia diretamente
        let newBaggage = Baggage(name: "Nova Bagagem", items: [])
        baggages.append(newBaggage)

        saveBaggages()

        baggageView.tableView.reloadData()
    }

    private func saveBaggages() {
        //        do {
        //            let data = try JSONEncoder().encode(baggages)
        //            try data.write(to: Baggage.archiveURL)
        //        } catch {
        //            print("Failed to save baggages: \(error)")
        //        }
        //    }
    }
}

extension BaggageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baggages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BaggageCell", for: indexPath)
        let baggage = baggages[indexPath.row]
        cell.textLabel?.text = baggage.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBaggage = baggages[indexPath.row]
        let baggageItemsViewController = BaggageItemsViewController(baggage: selectedBaggage)
        navigationController?.pushViewController(baggageItemsViewController, animated: true)
    }
}








