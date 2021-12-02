//
//  MainView.swift
//  birthDateData
//
//  Created by Santiago del Castillo Gonzaga on 01/12/21.
//

import SwiftUI

struct MainView: View {
    
    @State var selectedDate = Date()
    let screenSize: CGSize = UIScreen.main.bounds.size
    let ads: [AdModel] = [AdModel(link: "https://apps.apple.com/br/app/moodi/id1568151935", image: "Moodi"), AdModel(link: "https://apps.apple.com/br/app/avalanche-run/id1585684015", image: "AvalancheRun"), AdModel(link: "https://apps.apple.com/br/app/simplepacking/id1581175643", image: "SimplePacking"), AdModel(link: "https://apps.apple.com/br/app/devtopia-idle-game/id1568154053", image: "Devtopia")]
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 8) {
                Text("What happened")
                    .font(.system(size: 38, weight: .bold))
                
                HStack(alignment: .center) {
                    Text("on")
                        .font(.system(size: 38, weight: .bold))
                    DatePicker("", selection: $selectedDate, displayedComponents: .date)
                        .labelsHidden()
                    Text("?")
                        .font(.system(size: 38, weight: .bold))
                }
                
                NavigationLink(destination: ContentView()) {
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.red)
                            .frame(width: 230, height: 40, alignment: .center)
                            .cornerRadius(10)
                        Text("Search")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 32)
                }
                
                Button(action: {
                    if let url = URL(string: ads[0].link) {
                        UIApplication.shared.open(url)
                    }
                }){
                    Image(ads[0].image)
                        .frame(width: 290, height: 80, alignment: .center)
                }

            }
            .frame(width: screenSize.width, height: screenSize.height)
            .background(Color("Background"))
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
