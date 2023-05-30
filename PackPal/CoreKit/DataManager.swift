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
    private var baggages: [Baggage] = []

    private let tripsArchiveURL: URL
    private let baggagesArchiveURL: URL

    private init() {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Failed to retrieve documents directory.")
        }

        self.tripsArchiveURL = documentsDirectory.appendingPathComponent("tripsData")
        self.baggagesArchiveURL = documentsDirectory.appendingPathComponent("baggagesData.json")

        if let archivedTrips = loadTrips() {
            trips = archivedTrips
        }

        if let archivedBaggages = loadBaggages() {
            baggages = archivedBaggages
        }
    }

    // Trip methods
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
            let data = try JSONEncoder().encode(trips)
            try data.write(to: tripsArchiveURL)
        } catch {
            print("Failed to save trips: \(error)")
        }
    }

    private func loadTrips() -> [Trip]? {
        do {
            let data = try Data(contentsOf: tripsArchiveURL)
            return try JSONDecoder().decode([Trip].self, from: data)
        } catch {
            print("Failed to load trips: \(error)")
            return nil
        }
    }

    // Baggage methods
    func saveBaggage(_ baggage: Baggage) {
        baggages.append(baggage)
        saveBaggages()
    }

    func editBaggage(_ baggage: Baggage) {
        if let index = baggages.firstIndex(where: { $0.id == baggage.id }) {
            baggages[index] = baggage
            saveBaggages()
        }
    }

    func deleteBaggage(_ baggage: Baggage) {
        baggages.removeAll { $0.id == baggage.id }
        saveBaggages()
    }

    func getSavedBaggages() -> [Baggage] {
        return baggages
    }

    private func saveBaggages() {
        do {
            let data = try JSONEncoder().encode(baggages)
            try data.write(to: baggagesArchiveURL)
        } catch {
            print("Failed to save baggages: \(error)")
        }
    }

    private func loadBaggages() -> [Baggage]? {
        do {
            let data = try Data(contentsOf: baggagesArchiveURL)
            return try JSONDecoder().decode([Baggage].self, from: data)
        } catch {
            print("Failed to load baggages: \(error)")
            return nil
        }
    }
}
