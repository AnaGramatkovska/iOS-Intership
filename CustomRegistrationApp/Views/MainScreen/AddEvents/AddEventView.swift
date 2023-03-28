//
//  AddEvent.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 26.1.23.
//

import SwiftUI


struct AddEventView: View{
    
    @State private var description: String = ""
    @State private var location: String = ""
//    @State private var collaboration: String = ""
    @State private var name: String = ""
    @State private var tags: String = ""
    
    
    @State private var isPublic: Bool = false
    @State private var isPrivate: Bool = false

    @State private var collaboration = "ANYONE"
    var dropDownList = ["ANYONE", "ONLY_ME"]
    
    @ObservedObject var viewmodel = AddEventViewModel()
    @State var isLinkActive = false
    
    var body: some View{
        VStack{
            //  Spacer()
            Text ("**Add your event**")
                .fontDesign(.serif)
                .foregroundColor(Color("color2"))
                .font(.system(size: 25))
            
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: . center)){
                Image(systemName: "pencil")
                    .foregroundColor(Color.pink)                                       .font(.system(size:24))
                    .frame(width: 40, height: 40)
                TextField("Event Title", text: $name)
                    .padding(.horizontal)
                    .padding(.leading, 50)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .frame(height: 40)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(15)
                
            }
            
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: . center)){
                Image(systemName: "doc.plaintext")
                    .foregroundColor(Color.pink)
                    .font(.system(size:24))
                    .frame(width: 40, height: 40)
                
                TextField("Event description", text: $description)
                    .padding(.horizontal)
                    .padding(.leading, 50)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .frame(height: 40)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(15)
            }
            ZStack(alignment: Alignment(horizontal: .leading, vertical: . center)){
                Image(systemName: "location")
                    .foregroundColor(Color.pink)
                    .font(.system(size:24))
                    .frame(width: 40, height: 40)
                
                TextField("Event Location", text: $location)
                    .padding(.horizontal)
                    .padding(.leading, 50)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .frame(height: 40)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(15)
            }
            ZStack(alignment: Alignment(horizontal: .leading, vertical: . center)){
                Image(systemName: "tag")
                    .foregroundColor(Color.pink)
                    .font(.system(size:24))
                    .frame(width: 40, height: 40)
                
                TextField("Tags", text: $tags)
                    .padding(.horizontal)
                    .padding(.leading, 50)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .frame(height: 40)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(15)
            }
                
            
            HStack{

                Image(systemName: "pencil")
                    .foregroundColor(Color.pink)
                Text("Collaboration")
                    .foregroundColor(Color.pink)
            Picker("Select", selection: $collaboration){
                ForEach(dropDownList, id: \.self){
                    Text($0)
                }}
            .pickerStyle(.menu)

        }
    
            
            HStack{
                Text("Invite people")
                    .padding(.top, 10)
                    .foregroundColor(Color.pink)
                Button{
                    
                } label: {
                    Image(systemName: "person.badge.plus")
//                        .padding(.top, 20)
                        .foregroundColor(Color.pink)
                }}
            // Spacer()
            VStack{
                Toggle("Public Event", isOn: $isPublic)
                    .padding(.top, 20)
                    .foregroundColor(Color.pink)
                
                Toggle("Private Event", isOn: $isPrivate)
                    .foregroundColor(Color.pink)
                
                //    Spacer()
                
            }
            

                ZStack{
                    Image("event1")
                        .resizable()
                        .frame(width: 170, height:140)

                }
//            }
            //   Spacer ()
            //            Button{
            //                //ovde treba da se povika funkcijata za event
            //            } label: {
            //                Text("**Create event**")
            //
            //            }
            //           .padding(.top, 10)
            //            .foregroundColor(Color.pink)
            //            .buttonStyle(.bordered)
            //           // .background(Color.gray.opacity(0.2))
            //            .cornerRadius(10)
            //
            //        //   Spacer()
            NavigationLink(
                destination: NavAndToolBar(), isActive: $isLinkActive, label: {
                    Button(action: {
                        viewmodel.createEvent(collaboration: collaboration, description: description, isPublic: isPublic, location: location, name: name, tags: [tags]) { success in
                            if success {
                                self.isLinkActive = true
                            }
                            
                        }
                    }, label: {
                        Text("CREATE EVENT")
                            .padding(10)
                            .foregroundColor(Color.pink)
                            .buttonStyle(.bordered)
                            .background(Color.gray.opacity(0.6))
                            .cornerRadius(10)
                            .font(.system(size:24))
                    })
                    
                })
        }   .padding()
            .background(Color("bg"))
    }
}

struct AddEventView_Previews: PreviewProvider {
    static var previews: some View {
        AddEventView()
    }
}
