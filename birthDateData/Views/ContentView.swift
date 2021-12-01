//
//  ContentView.swift
//  birthDateData
//
//  Created by Matheus Homrich on 29/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var type: String = "events"
    let screenSize: CGSize = UIScreen.main.bounds.size
    var a: EventsViewModel = EventsViewModel()
    
    var body: some View {
        
        NavigationView() {
            VStack() {
                Picker(selection: $type, label: Text("Type"), content: {
                    Text("Historical events").tag("events")
                        .font(.system(size: 18))
                    Text("Births").tag("births")
                        .font(.system(size: 18))
                    Text("Deaths").tag("deaths")
                        .font(.system(size: 18))
                })
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: screenSize.width*0.9)
                
                ForEach(a.events, id: \.self) { event in
                    HStack(alignment: .center) {
                        Text(event.year)
                            .frame(width: screenSize.width*0.1)
                            .padding(.leading, screenSize.width*0.05)
                        Text(event.descritpion)
                            .frame(width: screenSize.width*0.55)
                            .padding([.leading, .trailing], screenSize.width*0.05)
                        Button(action: {
                            if let url = URL(string: event.link) {
                                UIApplication.shared.open(url)
                            }
                        }){
                            Image(systemName: "info.circle")
                        }
                        .frame(width: screenSize.width*0.05)
                        .padding(.trailing, screenSize.width*0.05)
                    }
                    .padding(.top, 16)
                }
                
            }
            .frame(width: screenSize.width, height: screenSize.height)
            .background(Color("Background"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
