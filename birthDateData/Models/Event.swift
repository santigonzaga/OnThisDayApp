//
//  Event.swift
//  birthDateData
//
//  Created by Matheus Homrich on 30/11/21.
//

import Foundation
import UIKit

struct Event: Decodable {
    let year: String
    let description: String
    let wikipedia: [Wikipedia]
}
