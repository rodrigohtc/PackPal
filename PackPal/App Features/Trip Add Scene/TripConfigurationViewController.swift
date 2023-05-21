//
//  TripConfigurationViewController.swift
//  PackPal
//
//  Created by Rodrigo on 21/05/23.
//

import UIKit

class TripConfigurationViewController: UIViewController {
    private var tripConfigurationView = TripConfigurationView()
    var trip: Trip?
    
    init(trip: Trip?) {
        self.trip = trip
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    override func loadView() {
        super.loadView()
        tripConfigurationView = TripConfigurationView()
        view = tripConfigurationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    @objc private func saveButtonTapped() {
        guard let destination = tripConfigurationView.destinationTextField.text,
              !destination.isEmpty,
              let tripName = tripConfigurationView.tripNameTextField.text,
              !tripName.isEmpty else {
            return
        }
        
        let departureDate = tripConfigurationView.departureDatePicker.date
        let returnDate = tripConfigurationView.returnDatePicker.date

        if var trip = trip {
            trip.destination = destination
            trip.tripName = tripName
            trip.departureDate = departureDate
            trip.returnDate = returnDate
        
            DataManager.shared.editTrip(trip)
        
        } else {
            let newTrip = Trip(
                tripName: tripName,
                destination: destination,
                departureDate: departureDate,
                returnDate: returnDate
            )
            DataManager.shared.saveTrip(newTrip)
        }
        
        let tripSavedViewController = TripSavedViewController()
        navigationController?.pushViewController(tripSavedViewController, animated: true)

    }
    
    private func configureView() {
        tripConfigurationView = TripConfigurationView()
        view = tripConfigurationView
        
        if let trip = trip {
            tripConfigurationView.destinationTextField.text = trip.destination
            tripConfigurationView.tripNameTextField.text = trip.tripName
            tripConfigurationView.departureDatePicker.date = trip.departureDate
            tripConfigurationView.returnDatePicker.date = trip.returnDate
        }
        
        tripConfigurationView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
}
