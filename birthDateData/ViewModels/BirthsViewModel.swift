//
//  BirthsViewModel.swift
//  birthDateData
//
//  Created by Matheus Homrich on 30/11/21.
//

import Foundation

struct BirthsViewModel {
    
    var births: [BirthViewModel] = []
    
    struct BirthViewModel {
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
    
    init(response: BirthsResponseData) {
        for birth in response.births {
            var birthViewModel = BirthViewModel()
            
            birthViewModel.year = birth.year
            birthViewModel.descritpion = birth.description
            
            for wikipedia in birth.wikipedia {
                birthViewModel.title = wikipedia.title
                birthViewModel.link = wikipedia.wikipedia
            }
            
            self.births.append(birthViewModel)
        }
    }
}

