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
    let ads: [AdModel] = [AdModel(link: "https://apps.apple.com/br/app/moodi/id1568151935?l=en", image: "Moodi"), AdModel(link: "https://apps.apple.com/br/app/avalanche-run/id1585684015?l=en", image: "AvalancheRun"), AdModel(link: "https://apps.apple.com/br/app/simplepacking/id1581175643?l=en", image: "SimplePacking"), AdModel(link: "https://apps.apple.com/app/devtopia-idle-game/id1568154053", image: "Devtopia")]
    @State var index: Int = 0
    @State var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    @State var hasClicked: Bool = false
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 8) {
                NavigationLink("", destination: ContentView(selectedDate: selectedDate), isActive: $hasClicked)
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
                .onTapGesture {
                    timer.upstream.connect().cancel()
                    hasClicked = true
                }
                
                Button(action: {
                    if let url = URL(string: ads[index].link) {
                        UIApplication.shared.open(url)
                    }
                }){
                    Image(ads[index].image)
                        .frame(width: 290, height: 80, alignment: .center)
                        .padding(.top, 200)
                }.onReceive(timer) { _ in
                    index += 1
                    if index > 3 {
                        index = 0
                    }
                }
                
                
            }
            .frame(width: screenSize.width, height: screenSize.height)
            .background(Color.black)
            .onAppear {
                timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
