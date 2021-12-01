//
//  EventsViewModel.swift
//  birthDateData
//
//  Created by Matheus Homrich on 30/11/21.
//

import Foundation

struct EventsViewModel {
    
    var events: [EventViewModel] = []
    
    struct EventViewModel {
        var year: String
        var descritpion: String
        var title: String
        var link: String
        
        init() {
            self.year = ""
            self.descritpion = ""
            self.title = ""
            self.link = ""
        }
    }
    
    init() {
        
    }
    
    init(response: EventsResponseData) {
        for event in response.events {
            var eventViewModel = EventViewModel()
            
            eventViewModel.year = event.year
            eventViewModel.descritpion = event.description
            
            for wikipedia in event.wikipedia {
                eventViewModel.title = wikipedia.title
                eventViewModel.link = wikipedia.wikipedia
            }
            
            self.events.append(eventViewModel)
        }
    }
}
