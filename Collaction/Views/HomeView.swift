//
//  HomeView.swift
//  Collaction
//
//  Created by Suchira  on 2021-10-16.
//

import SwiftUI

struct HomeView: View {
    @State private var isCreatingPost = false
    var body: some View {
        if(!isCreatingPost) {
            ZStack {
                CustomColours.DarkGrey
                    .ignoresSafeArea()
                
                VStack {
                    HStack(alignment: .top) {
                        Text("Home")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.leading, 2)
                        
                        Spacer()
                        
                        Button(action: {
                            isCreatingPost = true
                        }) {
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(Color.blue)
                                .font(.largeTitle)
                        }
                    }
                    .padding()
                    
                    ScrollView {
                        PostView()
                    }
                }
            }
        } else {
            CreatePostView()
        }
    }
}
    

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
