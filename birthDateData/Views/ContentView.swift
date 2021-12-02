//
//  ContentView.swift
//  birthDateData
//
//  Created by Matheus Homrich on 29/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var type: String = "events"
    var selectedDate: Date = Date()
    let screenSize: CGSize = UIScreen.main.bounds.size
    @ObservedObject var viewModel: ContentViewModel
    
    init() {
        viewModel = ContentViewModel(date: selectedDate)
    }
    
    var body: some View {
        
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
            
            
            
            ScrollView(.vertical) {
                ForEach(viewModel.deaths, id: \.self) { event in
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
            
        }
        .frame(width: screenSize.width, height: screenSize.height)
        .background(Color("Background"))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


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
