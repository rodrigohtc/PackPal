//
//  TripSavedViewController.swift
//  PackPal
//
//  Created by Rodrigo on 21/05/23.
//

import UIKit

class TripSavedViewController: UIViewController {
    let tripSavedView = TripSavedView()
    
    override func loadView() {
        super.viewDidLoad()
        view = tripSavedView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
    }
    
    override func viewDidLoad() {
        tripSavedView.nextTripsButton.addTarget(self, action: #selector(tripsButtonTapped), for: .touchUpInside)
        tripSavedView.customBagButton.addTarget(self, action: #selector(addBagsButtonTapped), for: .touchUpInside)
        tripSavedView.goHomeButton.addTarget(self, action: #selector(goHomeButtonTapped), for: .touchUpInside)
    }
    
    @objc private func tripsButtonTapped() {
        let tripListViewController = TripListViewController()
        navigationController?.pushViewController(tripListViewController, animated: true)
    }
    
    @objc private func addBagsButtonTapped() {
        // Navegue para a tela de adicionar malas ou faça a transição desejada
    }
    
    @objc private func goHomeButtonTapped() {
        let homeViewController = HomeViewController()
        navigationController?.pushViewController(homeViewController, animated: true)
    }
}

