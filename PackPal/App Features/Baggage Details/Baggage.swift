//
//  Baggage.swift
//  PackPal
//
//  Created by Rodrigo Cavalcanti on 29/05/23.
//
import Foundation

struct Baggage: Codable {
    var id: UUID
    var name: String
    var items: [String]
}

    extension Baggage {

    init(
        name: String,
        items: [String]
    ) {
        self.id = UUID()
        self.name = name
        self.items = items
    }
}
