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
    
    
    
    var body: some View {
        
        let a = OnThisDayService.shared.loadEventsFromAPI(month: "1", day: "1")
        
        
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
