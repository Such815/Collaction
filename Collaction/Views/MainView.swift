//
//  MainView.swift
//  Collaction
//
//  Created by Suchira  on 2021-10-17.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                        .font(.title2)
                        .fontWeight(.bold)
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
