//
//  LogInView.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 16.1.23.
//

import SwiftUI
import Firebase
import GoogleSignIn

//za da se gleda pwto
struct SecureTextField: View {
    @State var isSecureField: Bool = true
    @Binding var text: String
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
    }
}




struct LogInView: View {
    @ObservedObject var viewmodel = LoginViewModel()
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var userIsLoggedIn = UserDefaultsWorker.haveAuthToken()
    @State var isLinkActive = false
    
    var body: some View {
        NavigationView{
            VStack(spacing:40){
                ZStack{
                    Ellipse()
                        .frame(width:510, height:478)
                        .padding(.leading, -200)
                        .foregroundColor(Color("color2"))
                        .padding(.top, -200)
                    
                    Ellipse()
                        .frame(width:458, height:420)
                        .padding(.trailing, -500)
                        .foregroundColor(Color("color1"))
                        .padding(.top,-200)
                    
                    Text("Welcome \nto PICTALE")
                        .foregroundColor(.white)
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                        .padding(.top, 100)
                }
                
                VStack{
                    Spacer()
                    TextField("Email", text: $email)
                    SecureTextField(text: $password )
                    //  SecureField("Password", text: $password)
                    Spacer()
                    Spacer()
                    
                    Text("Forgot password?")
                        .foregroundColor(Color("color3"))
                    Button(action:  {}, label: {})
                }
                .foregroundColor(Color.black)
                .padding()
                .textFieldStyle(.roundedBorder)
                
                
                VStack{
                    NavigationLink(
                        destination: NavAndToolBar(), isActive: $isLinkActive, label: {
                            Button(action: {
                                viewmodel.signin(email: email, password: password) { success in
                                    if success  {
                                       self.isLinkActive=true
                            
                                    }}
                                
                            }, label: {
                                Text("SIGN IN ")
                                
                                
                            })
                        })
                    
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                }
                //ovde se zavrsva so kopceto SIGN IN
                
                HStack{
                    
                    
                    NavigationLink(
                        destination: NavAndToolBar(), isActive: $isLinkActive, label: {
                            Button(action: {
                                viewmodel.signInWithGoogle { success in
                                    if success {
                                       self.isLinkActive = true
                            
                                    }}
                                
                            }, label: {
                                Image("google")
                                    .resizable()
                                    .frame(width: 30, height:30)
                                    .padding(.horizontal, 40)
                                    .padding(.vertical, 15)
                                    .background(Color("color1"))
                                    .cornerRadius(15)
                                
                                
                            })
                        })
                    
                    
                    
                    Button(action: {}, label: {
                        
                        
                        Image("fb")
                            .resizable()
                            .frame(width: 30, height:30)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 15)
                            .background(Color("color1"))
                            .cornerRadius(15)
                        
                        
                    })
                    Button(action: {}, label: {
                        
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
                    Text("Don't have an account?")
                    
                    NavigationLink(destination: SignUpView(), isActive:$isLinkActive) {
                        
                        Button("SIGN UP") {
                            //    login()
                            
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
    //    func  login() {
    //        Auth.auth().signIn(withEmail: email, password: password){
    //            result, error in
    //            if error != nil {
    //                print(error!.localizedDescription)
    //            }
    //        }
    //    }
    //
    //    func register() {
    //        Auth.auth().createUser(withEmail: email, password: password) {
    //            result, error in
    //            if error != nil {
    //                print(error!.localizedDescription)
    //                    }
    //                }
    //
    //            }
}
struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

