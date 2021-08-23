//
//  ContentView.swift
//  WakeMe
//
//  Created by Madhav Raj Verma on 8/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Home().tabItem {
                HStack {
                    Image(systemName: "house")
                    Text("Home")
                        .font(.body)
                        .fontWeight(.bold)
                }
            }
            
            
            WakeMe().tabItem {
                HStack {
                    Image(systemName: "clock")
                    Text("WakeMe")
                        .font(.body)
                        .fontWeight(.bold)
                }
            }
        }.accentColor(.red)
        .onAppear {
            NotificationManager.instances.requestAuthroization()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
