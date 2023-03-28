////
////  NavAndToolBar.swift
////  CustomRegistrationApp
////
////  Created by Ana Gramatkovska on 25.1.23.
////
//
import SwiftUI

//
struct  NavAndToolBar: View {
       @State var isLinkActive = false

    var body: some View {
        NavigationStack{
            
            TabView{
                
                    AllEventsView()
                    .tabItem() {
                        
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width:24, height:24)
                        Text("ALL EVENTS")
                    }
                AddEventView()
                    .tabItem() {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width:24, height:24)
                        Text("ADD EVENTS")
                        
                    }
                MyEventsView()
                    .tabItem(){
                        Image(systemName: "books.vertical")
                            .resizable()
                            .scaledToFit()
                            .frame(width:24, height:24)
                        Text("MY EVENTS")
                        
                    }
            }
            
            .background(Color("bg"))
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("logo")
                        .resizable()
                        .frame(width: 35, height: 35)
                }
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink(destination: MyAccount(), isActive: $isLinkActive){
                        Button("acc") {
                            
                            //                            Image(systemName: "person-circle")
                            //                            .resizable()
                            //                            .frame(width: 35, height: 35)
                            self.isLinkActive = true
                            print("Button tapped!")
                        }
                    }
                    
                    
                    
                    
                }
                //
            }
        }
        .background(Color("bg"))
    }

}

struct  NavAndToolBar_Previews: PreviewProvider {
    static var previews: some View {
        NavAndToolBar()

    }
}

