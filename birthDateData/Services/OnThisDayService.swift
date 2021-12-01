//
//  OnThisDayService.swift
//  birthDateData
//
//  Created by Matheus Homrich on 30/11/21.
//

import Foundation

class OnThisDayService {
    
    static let shared: OnThisDayService = OnThisDayService()
    
    public func loadEventsFromAPI(month: String, day: String) -> EventsViewModel {
        
        var result: EventsViewModel = EventsViewModel()
        
        APIService.get(month: month, day: day, type: "events") {
            [weak self] (eventsResponseData: EventsResponseData?) in
            guard let eventsResponseData = eventsResponseData else { return }
            let eventsViewModel = EventsViewModel(response: eventsResponseData)
            
            result.events = eventsViewModel.events
            
        }
        
        return result
    }
    
    public func loadDeathsFromAPI(month: String, day: String) -> DeathsViewModel {
        
        var result: DeathsViewModel = DeathsViewModel()
        
        APIService.get(month: month, day: day, type: "deaths") {
            [weak self] (deathsResponseData: DeathsResponseData?) in
            guard let deathsResponseData = deathsResponseData else { return }
            let deathsViewModel = DeathsViewModel(response: deathsResponseData)
            
            result.deaths = deathsViewModel.deaths
        }
        
        return result
    }
    
    public func loadBirthsFromAPI(month: String, day: String) -> BirthsViewModel {
        
        var result: BirthsViewModel = BirthsViewModel()
        
        APIService.get(month: month, day: day, type: "births") {
            [weak self] (birthsResponseData: BirthsResponseData?) in
            guard let birthsResponseData = birthsResponseData else { return }
            let birthsViewModel = BirthsViewModel(response: birthsResponseData)
            
            result.births = birthsViewModel.births
        }
        
        return result
    }
    
}
