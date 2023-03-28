//
//  SignUpView.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 16.1.23.
//

import SwiftUI
import Firebase

struct SecureTextFields: View {
    @State var isSecureField: Bool = true
    @Binding var text: String
    @Binding var text1: String
    var body: some View{
        HStack{
            if isSecureField{
                SecureField("Password", text: $text)
            } else {
                TextField(text, text: $text)
            }
            
        } .overlay (alignment: .trailing){
            Image(systemName: isSecureField ? "eye.slash": "eye")
                .onTapGesture {
                    isSecureField.toggle()
                }
        }
        
        HStack{
            if isSecureField{
                SecureField("Confirm Password", text: $text1)
            } else {
                TextField(text1, text: $text1)
            }
            
        } .overlay (alignment: .trailing){
            Image(systemName: isSecureField ? "eye.slash": "eye")
                .onTapGesture {
                    isSecureField.toggle()
                }
        }
    }
}

struct SignUpView: View {
    @ObservedObject var viewmodel = SignUpViewModel()

    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var password: String = ""
    @State private var email: String = ""
    @State private var confirm_password: String = ""
    @State private var userIsLoggedIn = false
    @State var isLinkActive = false

    var body: some View {
        NavigationView{
            VStack(spacing:40){
                ZStack{
                    Ellipse()
                        .frame(width:458, height:420)
                        .padding(.trailing, -500)
                        .foregroundColor(Color("color2"))
                        .padding(.top,-200)
                    
                    Text("Create \nAccount")
                        .foregroundColor(Color("color2"))
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 40)
                        .padding(.top, 100)
                }
                
                VStack{
                    Spacer()
                    TextField("First Name", text: $firstName)
                    
                    TextField("Last Name", text: $lastName)
                    
                    TextField("Email", text: $email)
                    
                    SecureTextFields(text: $password, text1: $confirm_password )
                 
                    
                    Spacer()
                    
                    
                }
                .foregroundColor(Color.black)
                .padding()
                .textFieldStyle(.roundedBorder)
                
                VStack{
                    NavigationLink(destination: LogInView(), isActive:  $isLinkActive){
                        Button("SIGN UP")
                        {
                            viewmodel.signup(firstName: firstName, lastName: lastName, email: email, password: password) { korisnik in
                                
                               
                                
                                

                            }
                            self.isLinkActive = true
                            print("Button tapped!")
                        }
                        .font(.system(size: 25))
                        .padding(.leading,150)
                        Spacer()
                        Spacer()
                    }}
                //Ova e do kopceto SIGN UP
                
                
                HStack{
                    Button(action: {}, label: {
                        Image("google")
                            .resizable()
                            .frame(width: 30, height:30)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 15)
                            .background(Color("color1"))
                            .cornerRadius(15)
                        
                        Image("fb")
                            .resizable()
                            .frame(width: 30, height:30)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 15)
                            .background(Color("color1"))
                            .cornerRadius(15)
                        
                        Image("apple")
                            .resizable()
                            .frame(width: 30, height:30)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 15)
                            .background(Color("color1"))
                            .cornerRadius(15)
                        
                    })
                }
                Spacer()
                
                HStack{
                    Text("Already have account??")
           
                    NavigationLink(destination: LogInView(), isActive: $isLinkActive) {
                        Button("SIGN IN") {
                            
                            self.isLinkActive = true
                            print("Button tapped!")
                        }
                    }
                }
                .background(Color("color1"))
                .padding()
                Spacer()
                Spacer()
            }
            .background(Color("bg"))
            
        }
        .onAppear(){
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil {
                    userIsLoggedIn.toggle()
                }
                
            }
        }
    }
   
  
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
