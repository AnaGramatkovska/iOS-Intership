//
//  DetailEvent.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 17.2.23.
//

import SwiftUI

struct ChangeDetailEventView: View {
    @State private var eventtitle1: String = ""
    @State private var description1: String = ""
    @State private var location1: String = ""
    @State private var collaboration1: String = ""
    @State private var name1: String = ""
    @State private var tags1: String = ""
    
    
    @State private var isPublic1: Bool = false
    @State private var isPrivate1: Bool = false
    
    @State private var selection1 = "ANYONE"
    var dropDownList = ["ANYONE", "ONLY_ME"]
    
    @StateObject var viewModel = DetailEventViewModel()
    @State var isLinkActive = false

    var eventId : String
   
    var body: some View {
        VStack{
            
            Text ("**Change Information**")
                .fontDesign(.serif)
                .foregroundColor(Color("color2"))
                .font(.system(size: 25))
                .padding(.top, 60)
                .padding(.bottom, 60)
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
                Image(systemName: "pencil")
                    .foregroundColor(Color.pink)                                       .font(.system(size:24))
                    .frame(width: 40, height: 40)
                
                TextField(viewModel.event?.name ?? "", text: $eventtitle1)
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
                
                TextField("Event description", text: $description1)
                    .padding(.horizontal)
                    .padding(.leading, 60)
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
                
                TextField("Event Location", text: $location1)
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
                
                TextField("Tags", text: $tags1)
                    .padding(.horizontal)
                    .padding(.leading, 50)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .frame(height: 40)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(15)
            }
            .padding(.bottom, 30)
            HStack{
                
                Image(systemName: "pencil")
                    .foregroundColor(Color.pink)
                Text("Collaboration")
                    .foregroundColor(Color.pink)
                Picker("Select", selection: $selection1){
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
                        .padding(.top, 20)
                        .foregroundColor(Color.pink)
                }}
            
            VStack{
                Toggle("Public Event", isOn: $isPublic1)
                    .padding(.top, 20)
                    .foregroundColor(Color.pink)
                
                Toggle("Private Event", isOn: $isPrivate1)
                    .foregroundColor(Color.pink)
                
            }
//            Spacer()
            Button(action: {
                
                        }, label: {
                            Text("UPDATE EVENT")
                                .padding(10)
                                           .foregroundColor(Color.pink)
                                           .buttonStyle(.bordered)
                                           .background(Color.gray.opacity(0.6))
                                           .cornerRadius(10)
                                           .font(.system(size:24))
                        })
                        

            .padding(.top, 20)
        }
        
    }
    
}

struct ChangeDetailEventView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeDetailEventView(eventId: "")
    }
}
