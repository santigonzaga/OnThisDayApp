//
//  ContentView.swift
//  birthDateData
//
//  Created by Matheus Homrich on 29/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State public var month: String = ""
    @State public var day: String = ""
    
    let a = OnThisDayService.shared.loadEventsFromAPI(month: "1", day: "1")
    let b = OnThisDayService.shared.loadDeathsFromAPI(month: "1", day: "1")
    let c = OnThisDayService.shared.loadBirthsFromAPI(month: "1", day: "1")

    
    var body: some View {
        
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
