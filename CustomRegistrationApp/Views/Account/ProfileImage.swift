//
//  ProfileImage.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 8.2.23.
//

import SwiftUI

struct ProfileImage: View{
    
    @State var changeProfileImage = false
   @State var openCameraroll = false
    @State var imageSelceted = UIImage()
    
    var body: some View{
        
        ZStack(alignment: .bottomTrailing) {
          Button(action: {
                changeProfileImage = true
               openCameraroll = true
              
            }, label: {
                if changeProfileImage{
                    Image(uiImage: imageSelceted)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray))
                }else {
                    Image("profile")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray))
                }
         })
            Image(systemName: "plus")
                .foregroundColor(.white)
                .frame(width: 25, height: 25)
                .background(Color.blue)
                .clipShape(Circle())
        } .sheet(isPresented: $openCameraroll){
            ImagePicker(selectedImage: $imageSelceted, sourceType: .photoLibrary)
        }
    }
}


struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage()
    }
}
