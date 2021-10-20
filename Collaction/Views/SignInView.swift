//
//  AuthenticationView.swift
//  Collaction
//
//  Created by Suchira  on 2021-10-17.
//

import SwiftUI

struct AuthenticationView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AuthenticationHelpers
    
    var body: some View {
        if(!viewModel.signedIn) {
            NavigationView {
            ZStack {
                CustomColours.DarkGrey
                    .ignoresSafeArea()
                
                VStack {
                    Text("Sign In")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.top, 250.0)
                    
                    Spacer()
                    
                    TextField("Email", text: $email)
                        .modifier(customTextField(cornerRadius: 25.0, backgroundColor: CustomColours.LightGrey, textColor: Color.white, padding: 20, width: 320, height: 100))
                        .autocapitalization(.none)
                        .disableAutocorrection(true)

                    
                    SecureField("Password", text: $password)
                        .modifier(customTextField(cornerRadius: 25.0, backgroundColor: CustomColours.LightGrey, textColor: Color.white, padding: 20, width: 320, height: 100))
                        .padding(.bottom, 40)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    ZStack {
                        Button(action: {
                            guard !email.isEmpty, !password.isEmpty
                            else {
                                return
                            }
                            viewModel.signIn(email: email, password: password)
                            UserDefaults.standard.set(true, forKey: userDefaults.isSingedIn)
                        }) {
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(Color.blue)
                                .frame(width: 320, height: 80)
                        }
                        
                        Text("Confirm")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        
                    }.padding(.bottom, 20.0)
                    
                        NavigationLink(destination: SignUpView()) {
                        Text("Dont Have An Account?")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        
                        }.padding(.bottom, 330.0)
                }
            }
            }
        } else {
            MainView()
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
