//
//  PostView.swift
//  Collaction
//
//  Created by Suchira  on 2021-10-16.
//

import SwiftUI

extension String {
    func load() -> UIImage {
        do {
            guard let url = URL(string: self) else {
                return UIImage()
            }
            
            let data: Data = try Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
                
        } catch {
            print("URL Is not valid")
        }
        
        return UIImage()
    }
}

struct PostView: View {
    var author = ""
    var caption = ""
    var postURL = ""
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(CustomColours.LightGrey)
                .padding()
                .frame(height: 500)
            
            VStack {
                
                HStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .padding([.leading, .bottom], 25.0)
                    Text(author)//Author
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
                
                Image(uiImage: postURL.load())
                    .resizable()
                     .padding(.bottom, 15)
                     .frame(width: 320, height: 300)
                     .cornerRadius(25.0)
                
                HStack {
                    
                    Text(caption)//Caption
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

