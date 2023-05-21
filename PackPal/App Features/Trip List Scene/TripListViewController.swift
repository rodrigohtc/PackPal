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
        
        loadTrips()
    }
    
    private func loadTrips() {
        trips = dataManager.getSavedTrips()
        tripListView.tableView.reloadData()
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
        cell.textLabel?.text = trip.tripName // Assuming 'name' is a property of the Trip model
        return cell
    }
}
