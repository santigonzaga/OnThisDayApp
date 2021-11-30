//
//  DeathsViewModel.swift
//  birthDateData
//
//  Created by Matheus Homrich on 30/11/21.
//

import Foundation

struct DeathsViewModel {

    var deaths: [DeathViewModel] = []
    
    struct DeathViewModel {
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
    
    init(response: DeathsResponseData) {
        for death in response.deaths {
            var deathViewModel = DeathViewModel()
            
            deathViewModel.year = death.year
            deathViewModel.descritpion = death.description
            
            for wikipedia in death.wikipedia {
                deathViewModel.title = wikipedia.title
                deathViewModel.link = wikipedia.wikipedia
            }
            
            self.deaths.append(deathViewModel)
        }
    }
}

