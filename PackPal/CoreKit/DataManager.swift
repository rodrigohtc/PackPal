//
//  DataManager.swift
//  PackPal
//
//  Created by Rodrigo on 21/05/23.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private var trips: [Trip] = []
    
    private let tripsArchiveURL: URL
    
    private init() {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Failed to retrieve documents directory.")
        }
        
        self.tripsArchiveURL = documentsDirectory.appendingPathComponent("tripsData")
        
        if let archivedTrips = loadTrips() {
            trips = archivedTrips
        }
    }
    
    func saveTrip(_ trip: Trip) {
        trips.append(trip)
        saveTrips()
    }
    
    func editTrip(_ trip: Trip) {
        if let index = trips.firstIndex(where: { $0.id == trip.id }) {
                trips[index] = trip
                saveTrips()
            }
    }
    
    func deleteTrip(_ trip: Trip) {
        trips.removeAll { $0.id == trip.id }
        saveTrips()
    }
    
    func getSavedTrips() -> [Trip] {
        return trips
    }
    
    private func saveTrips() {
        do {
            let data = try PropertyListEncoder().encode(trips)
            try data.write(to: tripsArchiveURL)
        } catch {
            print("Failed to save trips: \(error)")
        }
    }
    
    private func loadTrips() -> [Trip]? {
        do {
            let data = try Data(contentsOf: tripsArchiveURL)
            return try PropertyListDecoder().decode([Trip].self, from: data)
        } catch {
            print("Failed to load trips: \(error)")
            return nil
        }
    }
}
