//
//  Event.swift
//  birthDateData
//
//  Created by Matheus Homrich on 30/11/21.
//

import Foundation

struct EventsResponseData: Codable {
    let events: [Event]
    
    struct Event: Codable {
        let year: String
        let description: String
        let wikipedia: [Wikipedia]
    }
    
    struct Wikipedia: Codable {
        let title: String
        let wikipedia: String
    }
    
}
