//
//  MyAccount.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 24.1.23.
//

import SwiftUI




struct MyAccount: View {
    @ObservedObject var viewmodel = MyAccountViewModel()

    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var old_password: String = ""
    @State private var email: String = ""
    @State private var new_password: String = ""
    @State private var confirm_password: String = ""
    @State private var renew_password: String = ""
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                ProfileImage()
                Spacer()
                //POLINJA
                VStack(spacing: 15){
                    TextField("First Name", text:$firstname)
                    
                    TextField("Last Name", text: $lastname)
                    
                    // TextField("Email", text: $email)
                    VStack{
                        Button(action: {
                            viewmodel.updateUser(firstName: firstname, lastName: lastname){ korisnik in
                                if korisnik{
                                    print("uspesna promena")
                                }
                            }
                        }, label: {
                            Text("SAVE")
                        })
                        .font(.system(size: 20))
                    }
                    SecureField("Old password", text: $old_password)
                    
                    SecureField("New Password", text: $new_password)
                    SecureField("Confirm Password", text: $renew_password)
                    
                    Button(action: {
                        viewmodel.updatePw(oldPassword: old_password, newPassword: new_password, reNewPassword: renew_password){ korisnik in
                            if korisnik{
                                print("Uspesna promena")
                            }
                        }
                        
                    }, label: {
                        Text("UPDATE \nPASSWORD")
                    })
                    .font(.system(size: 20))
                }
                .foregroundColor(Color.black)
                .padding()
                .textFieldStyle(.roundedBorder)
                
                //kopce SAVE
                Spacer()
         
                Button(action: {
//                    viewmodel.logOut()
                    
                }, label: {
                    Text("LOG OUT")
                })
                .font(.system(size: 25))
                
                
                
                
                //.font(.system(size: 25))
                //                }
                Spacer()
                
                //naslov
                    .navigationBarTitle("My Account")
                
                
            }//tuka zavrsva VStack
            .background(Color("color1")) //boja na pozadinata
          
        }
    }
}
    struct MyAccount_Previews: PreviewProvider {
        static var previews: some View {
            MyAccount()
        }
    }

//func saveImage(){
//        Storage.storage().reference().child("profilepics").child(id!).putData(self.imagedata, metadata: nil) { (_, err) in
//            
//            if err != nil{
//                
//                print((err?.localizedDescription)!)
//                return
//            }
//            
//            Storage.storage().reference().child("profilepics").child(id!).downloadURL { (url, err) in
//                
//                if err != nil{
//                    
//                    print((err?.localizedDescription)!)
//                    return
//                }
//            }
//        }
//    }
