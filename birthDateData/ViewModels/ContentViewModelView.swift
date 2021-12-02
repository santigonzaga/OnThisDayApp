//
//  ContentViewModelView.swift
//  birthDateData
//
//  Created by Santiago del Castillo Gonzaga on 02/12/21.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var events: [EventsViewModel.EventViewModel] = []
    @Published var deaths: [DeathsViewModel.DeathViewModel] = []
    @Published var births: [BirthsViewModel.BirthViewModel] = []
    
    init(date: Date) {
        loadData(date: date)
    }
    
    func loadData(date: Date) {
        
        let component = date.get(.day, .month)
        let month: String = "\(component.month ?? 1)"
        let day: String = "\(component.day ?? 1)"
        
        OnThisDayService.shared.loadEventsFromAPI(month: month, day: day) { eventViewModel in
            DispatchQueue.main.async {
                self.events = eventViewModel.events
            }
        }
        
        OnThisDayService.shared.loadDeathsFromAPI(month: month, day: day) { deathViewModel in
            DispatchQueue.main.async {
                self.deaths = deathViewModel.deaths
            }
        }
        
        OnThisDayService.shared.loadBirthsFromAPI(month: month, day: day) { birthViewModel in
            DispatchQueue.main.async {
                self.births = birthViewModel.births
            }
        }
    }
}
