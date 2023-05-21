//
//  TripDetailsViewController.swift
//  PackPal
//
//  Created by Rodrigo on 21/05/23.
//

import UIKit

class TripDetailsViewController: UIViewController {
    private let trip: Trip
    private var tripDetailsView = TripDetailsView()
    
        init(trip: Trip) {
            self.trip = trip
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    override func loadView() {
        super.loadView()
        tripDetailsView = TripDetailsView()
        view = tripDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        
        tripDetailsView.tripDetailsLabel.text = "Detalhes da viagem: \(trip.tripName)"
        tripDetailsView.editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        tripDetailsView.addBagsButton.addTarget(self, action: #selector(addBagsButtonTapped), for: .touchUpInside)
    }
    
    @objc private func editButtonTapped() {
//        guard let trip = trip else { return }
        let tripConfigurationViewController = TripConfigurationViewController(trip: trip)
        navigationController?.pushViewController(tripConfigurationViewController, animated: true)
    }
    
    @objc private func addBagsButtonTapped() {
        // Navegue para a tela de adicionar malas ou faça a transição desejada
    }
}
