//
//  HomeViewController.swift
//  PackPal
//
//  Created by Rodrigo on 21/05/23.
//

import UIKit

import UIKit

class HomeViewController: UIViewController {
    private var homeView = HomeView()
    
    override func loadView() {
        super.loadView()
        view = homeView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        homeView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        homeView.nextTripsButton.addTarget(self, action: #selector(nextTripsButtonTapped), for: .touchUpInside)
        homeView.customBagButton.addTarget(self, action: #selector(customBagButtonTapped), for: .touchUpInside)
    }
    
    @objc private func addButtonTapped() {
        let tripConfigurationViewController = TripConfigurationViewController(trip: nil)
        navigationController?.pushViewController(tripConfigurationViewController, animated: true)
    }
    
    @objc private func nextTripsButtonTapped() {
        let tripListViewController = TripListViewController()
        navigationController?.pushViewController(tripListViewController, animated: true)    }
    
    @objc private func customBagButtonTapped() {
        // Implemente a lógica para adicionar uma mala personalizada
    }
}


