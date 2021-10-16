//
//  CreatePostView.swift
//  Collaction
//
//  Created by Suchira  on 2021-10-16.
//

import SwiftUI

struct CreatePostView: View {
    @State var postCaption = ""
    @State private var isCancelled = false
    var body: some View {
        if(!isCancelled) {
            ZStack {
                CustomColours.DarkGrey
                    .ignoresSafeArea()
                
                VStack() {
                    HStack {
                        Button(action: {
                            isCancelled = true
                        }) {
                            Text("Cancel")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(Color.blue)
                                .padding(.all)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "photo")
                            .foregroundColor(Color.blue)
                            .font(.title)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(Color.blue)
                                .frame(width: 90, height: 35)
                            
                            Text("Post")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        }
                        .padding(.all)
                    }
                    
                    Spacer()
                    
                    ScrollView {
                        Image("Waterfall")
                            .resizable()
                            .frame(width: 350, height: 350, alignment: .center)
                            .cornerRadius(25.0)
                    
                    Spacer()
                    
                    TextField("Type Your Caption...", text: $postCaption)
                        .modifier(customTextField(cornerRadius: 15.0, backgroundColor: CustomColours.LightGrey, textColor: .white, padding: 12.0, width: 350, height: 100))
                        .padding(.horizontal, 15.0)
                    }
                }
            }
        } else {
            HomeView()
        }
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}
