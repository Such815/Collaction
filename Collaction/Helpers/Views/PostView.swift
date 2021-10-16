//
//  PostView.swift
//  Collaction
//
//  Created by Suchira  on 2021-10-16.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(CustomColours.LightGrey)
                .padding()
                .frame(height: 500)
            
            VStack {
                
                HStack {
                    Image("Waterfall")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .padding([.leading, .bottom], 25.0)
                    Text("Tim Cook")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 25.0)
                    Spacer()
                    Image(systemName: "ellipsis")
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding(.all, 25.0)
                }
                
                Image("Waterfall")
                    .resizable()
                    .padding(.bottom, 15)
                    .frame(width: 320, height: 300)
                    .cornerRadius(25.0)
                
                HStack {
                    
                    Text("A Nice Waterfall.")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.leading, 30.0)
                    
                    Spacer()
                }
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
