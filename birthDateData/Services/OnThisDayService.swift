//
//  OnThisDayService.swift
//  birthDateData
//
//  Created by Matheus Homrich on 30/11/21.
//

import Foundation

class OnThisDayService {
    
    static let shared: OnThisDayService = OnThisDayService()
    
    public func loadEventsFromAPI(month: String, day: String) {
        OnThisDayAPI.get(month: month, day: day, type: "events") {
            [weak self] (eventsResponseData: EventsResponseData?) in
            guard let eventsResponseData = eventsResponseData else { return }
            let eventsViewModel = EventsViewModel(response: eventsResponseData)
            
            DispatchQueue.main.async {
                print(eventsViewModel.events)
            }
        
        }
        return
    }
    
        public func loadDeathsFromAPI(month: String, day: String) {
            OnThisDayAPI.get(month: month, day: day, type: "deaths") {
                [weak self] (deathsResponseData: DeathsResponseData?) in
                guard let deathsResponseData = deathsResponseData, let self = self else { return }
                let deathsViewModel = DeathsViewModel(response: deathsResponseData)
                
                DispatchQueue.main.async {
                    print(deathsViewModel.deaths)
                }
    
            }
            return
        }
    
        public func loadBirthsFromAPI(month: String, day: String) {
            OnThisDayAPI.get(month: month, day: day, type: "births") {
                [weak self] (birthsResponseData: BirthsResponseData?) in
                guard let birthsResponseData = birthsResponseData, let self = self else { return }
                let birthsViewModel = BirthsViewModel(response: birthsResponseData)
                
                DispatchQueue.main.async {
                    print(birthsViewModel.births)
                }
            }
            return
        }
    
}
