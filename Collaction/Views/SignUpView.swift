//
//  SignUpView.swift
//  Collaction
//
//  Created by Suchira  on 2021-10-17.
//

import SwiftUI

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AuthenticationHelpers
    
    var body: some View {
        ZStack {
            CustomColours.DarkGrey
                .ignoresSafeArea()
            
            VStack {
                Text("Create Account")
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
                        viewModel.signUp(email: email, password: password)
                    }) {
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(Color.blue)
                            .frame(width: 320, height: 80)
                    }
                    
                    Text("Confirm")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    
                }.padding(.bottom, 330.0)
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
