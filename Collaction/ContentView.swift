//
//  ContentView.swift
//  Collaction
//
//  Created by Suchira  on 2021-10-16.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggingIn = false
    @EnvironmentObject var viewModel: AuthenticationHelpers
    
    var body: some View {
        if UserDefaults.standard.bool(forKey: userDefaults.isSingedIn) {
            MainView()
        } else {
        if !isLoggingIn {
            ZStack {
                CustomColours.DarkGrey
                    .ignoresSafeArea()
                
                VStack {
                    Text("Welcome!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.top, 300)
                    
                    Spacer()
                    
                    Button(action: {
                        isLoggingIn = true
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(CustomColours.LightGrey)
                                .frame(width: 270, height: 80, alignment: .center)
                        
                            Text("Sign In To Start")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        }.padding(.bottom, 300)
                    }
                }
            }

        } else {
            AuthenticationView()
        }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
