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
    
    var body: some View {
        
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
            
            Button(action: {
                
            }){
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
        }
        .frame(width: screenSize.width, height: screenSize.height)
        .background(Color("Background"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
