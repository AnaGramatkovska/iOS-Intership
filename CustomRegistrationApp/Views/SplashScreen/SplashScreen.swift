//
//  SplashScreen.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 1.2.23.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive: Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State private var isLogged = UserDefaultsWorker.haveAuthToken()
   
    var body: some View {
        
        if isActive {
            if isLogged {
                NavAndToolBar()
            } else {
                LogInView()
            }
        } else {
            
            VStack(){
                ZStack{
                    Ellipse()
                        .frame(width:510, height:478)
                        .padding(.leading, -200)
                        .foregroundColor(Color("color2"))
                        .padding(.top, -20)
                    
                    Ellipse()
                        .frame(width:458, height:420)
                        .padding(.trailing, -500)
                        .foregroundColor(Color("color1"))
                        .padding(.top,-200)
                    
                    //                    Text("Welcome \nto PICTALE")
                    //                                        .foregroundColor(.pink)
                    //                                        .font(.system(size: 35))
                    //                                        .fontWeight(.bold)
                    //                                        .multilineTextAlignment(.leading)
                    //                                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    
                    
                    Text("Welcome to \nPICTALE")
                        .font(.system(size:35))
                        .foregroundColor(.pink)
                    
//                    Image(systemName: "arrowshape.right.fill")
//                        .font(.system(size:80))
//                        .foregroundColor(.pink)
//
                    
                }
                
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 1
                        self.opacity = 1
                    }
                }
            }
            .onAppear{
                  DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                withAnimation{
                    self.isActive = true
                }
               
            }
        }
        }
            
           
        
        
    }
            }

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
