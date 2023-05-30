//
//  TripListViewController.swift
//  PackPal
//
//  Created by Rodrigo on 21/05/23.
//

import UIKit

class TripListViewController: UIViewController {
    private let tripListView = TripListView()
    private let dataManager = DataManager.shared
    private var trips: [Trip] = []
    
    override func loadView() {
        view = tripListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Trips"
        
        tripListView.tableView.delegate = self
        tripListView.tableView.dataSource = self
        tripListView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TripCell")

        tripListView.addTripButton.addTarget(self, action: #selector(addTripButtonTapped), for: .touchUpInside)


        loadTrips()
    }
    
    private func loadTrips() {
        trips = dataManager.getSavedTrips()
        tripListView.tableView.reloadData()
    }

    @objc private func addTripButtonTapped() {
        let tripConfigurationVC = TripConfigurationViewController(trip: nil)
        navigationController?.pushViewController(tripConfigurationVC, animated: true)
    }


}

// MARK: - UITableViewDelegate

extension TripListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTrip = trips[indexPath.row]
        let tripDetailsViewController = TripDetailsViewController(trip: selectedTrip)
        navigationController?.pushViewController(tripDetailsViewController, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension TripListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TripCell", for: indexPath)
        let trip = trips[indexPath.row]
        cell.textLabel?.text = trip.tripName
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteTrip(at: indexPath)
        }
    }

    private func deleteTrip(at indexPath: IndexPath) {
        let trip = trips[indexPath.row]
        DataManager.shared.deleteTrip(trip)

        trips.remove(at: indexPath.row)
        tripListView.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}
