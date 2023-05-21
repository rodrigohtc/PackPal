//
//  Trip.swift
//  PackPal
//
//  Created by Rodrigo on 21/05/23.
//

import Foundation

struct Trip: Codable, Identifiable {
    var id: UUID
    var tripName: String
    var destination: String
    var departureDate: Date
    var returnDate: Date
}

extension Trip {
    
    init(
        tripName: String,
        destination: String,
        departureDate: Date,
        returnDate: Date
    ) {
        self.id = UUID()
        self.tripName = tripName
        self.destination = destination
        self.departureDate = departureDate
        self.returnDate = returnDate
    }
}

