//
//  MainView.swift
//  Collaction
//
//  Created by Suchira  on 2021-10-17.
//

import SwiftUI
import UIKit
import Introspect

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
        }.introspectTabBarController { controller in let bar = UITabBarAppearance()
            bar.configureWithOpaqueBackground()
            bar.backgroundColor = UIColor(CustomColours.LightGrey)
            if #available(iOS 15.0, *) {
                controller.tabBar.scrollEdgeAppearance = bar
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
