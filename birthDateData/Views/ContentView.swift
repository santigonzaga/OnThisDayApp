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
    
    func loadEventsFromAPI() {
        OnThisDayService.get(month: "1", day: "1", type: "events", completionHandler: [weak self] in Events)
    }
    
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
