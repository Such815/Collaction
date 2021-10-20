//
//  CreatePostView.swift
//  Collaction
//
//  Created by Suchira  on 2021-10-16.
//

import SwiftUI
import Foundation


struct CreatePostView: View {
    @State private var isCancelled = false
    @ObservedObject var viewModel = PostsViewModel()
    @State var postCaption = ""
    @State var updatedUrl = ""
    @State private var inputImage: UIImage?
    @State private var image: Image?
    @State var imageData: Data?
    @State private var iShowingImagePicker = false
    var firstRemoval = "Optional("
    var secondRemoval = ")"
    
    func loadImage() {
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
    }
    
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
                        
                        Button(action: {
                            self.iShowingImagePicker = true
                        }) {
                        Image(systemName: "photo")
                            .foregroundColor(Color.blue)
                            .font(.title)
                        }
                        
                        Button(action: {
                            imageData = inputImage?.jpegData(compressionQuality: 0.2)
                            
                            uploadImage(title: postCaption, imageData: imageData ?? Data(count: 0), path: "posts") { url in
                                
                                if let range = url.range(of: firstRemoval) {
                                    updatedUrl = url
                                    updatedUrl.removeSubrange(range)
                                }
                                
                                if let range = updatedUrl.range(of: secondRemoval) {
                                    updatedUrl.removeSubrange(range)
                                }
                                
                                viewModel.createPost(author: CurrentUser.userEmail ?? "", caption: postCaption, postURL: updatedUrl)
                            }
                            
                            isCancelled = true
                        }) {
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
                    }
                    
                    Spacer()
                    
                    ScrollView {
                        if image != nil {
                            image?
                                .resizable()
                                .frame(width: 350, height: 350, alignment: .center)
                                .cornerRadius(25.0)
                        } else {
                            Text("Select An Image")
                                .bold()
                                .font(.title2)
                                .foregroundColor(.blue)
                                .padding(.vertical, 140)
                        }
                            
                    Spacer()
                    
                        TextField("Type Your Caption...", text: $postCaption)
                        .modifier(customTextField(cornerRadius: 15.0, backgroundColor: CustomColours.LightGrey, textColor: .white, padding: 12.0, width: 350, height: 100))
                        .padding(.horizontal, 15.0)
                    }
                }
            }.sheet(isPresented: $iShowingImagePicker, onDismiss: loadImage, content: {
                ImagePicker(image: self.$inputImage)
            })
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
