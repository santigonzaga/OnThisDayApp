//
//  DeathsResponseData.swift
//  birthDateData
//
//  Created by Matheus Homrich on 30/11/21.
//

import Foundation

struct DeathsResponseData: Codable {
    let deaths: [Death]
    
    struct Death: Codable {
        let year: String
        let description: String
        let wikipedia: [Wikipedia]
    }
    
    struct Wikipedia: Codable {
        let title: String
        let wikipedia: String
    }
    
}
