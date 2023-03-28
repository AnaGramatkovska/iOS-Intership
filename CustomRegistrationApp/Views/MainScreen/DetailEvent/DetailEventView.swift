//
//  DetailEventView.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 19.2.23.
//

import SwiftUI

struct DetailEventView: View {
    @State var isLinkActive = false
    @StateObject var viewModel = DetailEventViewModel()
    var eventId : String


    var body: some View {
        VStack{
            //            HStack{
                Text("**Event Detail**")
                    .fontDesign(.serif)
                    .foregroundColor(Color("color3"))
                    .font(.system(size: 35))
                
            Text(viewModel.event?.name ?? "")
                    .fontDesign(.serif)
                    .foregroundColor(Color.black)
                    .font(.system(size: 25))
                    .padding(.top,20)
                    .padding(.bottom,30)
                
                ZStack(alignment: Alignment(horizontal: .leading, vertical: . center)){
                    Image(systemName: "photo")
                        .foregroundColor(Color.pink)
                        .font(.system(size:24))
                        .frame(width: 40, height: 40)
                        .padding(.trailing, 40)
                    
                    Button(action: {
                   
                    }, label: {
                        Text("UPLOAD PHOTOS")
                            .padding(10)
                            .padding(.leading, 40)
                            .foregroundColor(Color.pink)
                            .buttonStyle(.bordered)
                            .background(Color.gray.opacity(0.6))
                            .cornerRadius(10)
                            .font(.system(size:16))
                    })
                }
                
                
                
                ZStack(alignment: Alignment(horizontal: .leading, vertical: . center)){
                    Image(systemName: "heart")
                        .foregroundColor(Color.pink)
                        .font(.system(size:24))
                        .frame(width: 40, height: 40)
                        .padding(.trailing, 40)
                    
                    Button(action: {
                        
                    }, label: {
                        Text("ADD TO FAVOURITES")
                            .padding(10)
                            .padding(.leading, 40)
                            .foregroundColor(Color.pink)
                            .buttonStyle(.bordered)
                            .background(Color.gray.opacity(0.6))
                            .cornerRadius(10)
                            .font(.system(size:16))
                    })
                }
                ZStack(alignment: Alignment(horizontal: .leading, vertical: . center)){
                    Image(systemName: "heart.slash")
                        .foregroundColor(Color.pink)
                        .font(.system(size:24))
                        .frame(width: 40, height: 40)
                        .padding(.trailing, 40)
                    
                    Button(action: {
                        
                    }, label: {
                        Text("REMOVE TO FAVOURITES")
                            .padding(10)
                            .padding(.leading, 40)
                            .foregroundColor(Color.pink)
                            .buttonStyle(.bordered)
                            .background(Color.gray.opacity(0.6))
                            .cornerRadius(10)
                            .font(.system(size:16))
                    })
                }
                
                HStack{
                    Image("event1")
                        .resizable()
                        .frame(width: 200, height:140)
                    Image("event1")
                        .resizable()
                        .frame(width: 200, height:140)
                }
                
                
                
                ZStack(alignment: Alignment(horizontal: .leading, vertical: . center)){
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(Color.black
                        )
                        .font(.system(size:24))
                        .frame(width: 40, height: 40)
                        .padding(.trailing, 40)
                    
                    
                    NavigationLink(
                        destination: ChangeDetailEventView(eventId: eventId), isActive: $isLinkActive, label: {
                            Button(action: {
                                self.isLinkActive = true
                                
                            }, label: {
                                
                                Text("CHANGE EVENT DETAILS")
                                    .padding(10)
                                    .padding(.leading, 40)
                                    .foregroundColor(Color.black)
                                    .buttonStyle(.bordered)
                                    .background(Color.pink.opacity(0.2))
                                    .cornerRadius(10)
                                    .font(.system(size:16))
                            })
                        })
                }                .padding(.top,30)
                
                
                
                
                
                Spacer()
                
            }
        
                .task {
                    viewModel.getEventById(id: eventId)
                }
//
    }
    
}

struct DetailEventView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEventView(eventId: "")
    }
}
