//
//  DeathsViewModel.swift
//  birthDateData
//
//  Created by Matheus Homrich on 30/11/21.
//

import Foundation

class DeathsViewModel {

    var deaths: [DeathViewModel] = []
    
    struct DeathViewModel: Hashable {
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

