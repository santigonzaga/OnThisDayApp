//
//  ContentView.swift
//  birthDateData
//
//  Created by Matheus Homrich on 29/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var type: String = "events"
    var selectedDate: Date
    let screenSize: CGSize = UIScreen.main.bounds.size
    @ObservedObject var viewModel: ContentViewModel
    
    init(selectedDate: Date) {
        self.selectedDate = selectedDate
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
                .frame(width: screenSize.width*0.9, height: 100)
                .padding(.top, 48)
            
            if type == "deaths" {
                ScrollView(.vertical) {
                    ForEach(viewModel.deaths, id: \.self) { event in
                        HStack(alignment: .center) {
                            Text(event.year)
                                .frame(width: screenSize.width*0.12)
                                .padding(.leading, screenSize.width*0.03)
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
                .padding(.bottom, 64)
            } else if type == "births" {
                ScrollView(.vertical) {
                    ForEach(viewModel.births, id: \.self) { event in
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
            } else {
                ScrollView(.vertical) {
                    ForEach(viewModel.events, id: \.self) { event in
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
        }
        .frame(width: screenSize.width, height: screenSize.height)
        .background(Color("Background"))

    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selectedDate: Date())
    }
}
