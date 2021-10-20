//
//  ProfileView.swift
//  Collaction
//
//  Created by Suchira  on 2021-10-17.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthenticationHelpers
    
    var body: some View {
        ZStack {
            CustomColours.DarkGrey
                .ignoresSafeArea()
            
            VStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .font(.title)
                    .foregroundColor(CustomColours.LightGrey)
                    .frame(width: 150, height: 150)
                    .padding(.top, 100.0)
                
                //Spacer()
                
                Text(CurrentUser.userID ?? "No UID")
                    .bold()
                    .foregroundColor(.white)
                    .font(.title2)
                    .padding(.top, 25)
                
                Text(CurrentUser.userEmail ?? "No Email")
                    .bold()
                    .foregroundColor(.white)
                    .font(.title3)
                    .padding(.top, 10)
                
                Spacer()
                
                Button(action: {
                    viewModel.signOut()
                    UserDefaults.standard.set(false, forKey: userDefaults.isSingedIn)
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(Color.blue)
                            .frame(width: 200, height: 70)
                        
                        Text("Sign Out")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }
                }.padding(.bottom, 25)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
