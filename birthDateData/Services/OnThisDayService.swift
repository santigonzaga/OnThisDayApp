//
//  OnThisDayService.swift
//  birthDateData
//
//  Created by Matheus Homrich on 30/11/21.
//

import Foundation

class OnThisDayService {
    
    static let shared: OnThisDayService = OnThisDayService()
    
    public func loadEventsFromAPI(month: String, day: String, completion: @escaping (EventsViewModel) -> Void) {
        
        APIService.get(month: month, day: day, type: "events") {
            [weak self] (eventsResponseData: EventsResponseData?) in
            guard let eventsResponseData = eventsResponseData else { return }
            let eventsViewModel = EventsViewModel(response: eventsResponseData)
            
            completion(eventsViewModel)
            
        }
        
    }
    
    public func loadDeathsFromAPI(month: String, day: String, completion: @escaping (DeathsViewModel) -> Void) {
        
        APIService.get(month: month, day: day, type: "deaths") {
            [weak self] (deathsResponseData: DeathsResponseData?) in
            guard let deathsResponseData = deathsResponseData else { return }
            let deathsViewModel = DeathsViewModel(response: deathsResponseData)
            
            completion(deathsViewModel)
            
        }
        
    }
    
    public func loadBirthsFromAPI(month: String, day: String, completion: @escaping (BirthsViewModel) -> Void) {
        
        APIService.get(month: month, day: day, type: "births") {
            [weak self] (birthsResponseData: BirthsResponseData?) in
            guard let birthsResponseData = birthsResponseData else { return }
            let birthsViewModel = BirthsViewModel(response: birthsResponseData)
            
            completion(birthsViewModel)
            
        }
        
    }
    
}
