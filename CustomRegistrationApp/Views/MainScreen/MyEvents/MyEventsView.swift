//
//  MyEvents.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 26.1.23.
//

import SwiftUI


struct MyEventsView: View{
    @State var isLinkActive = false
    //    var eventId : String
    
    var body: some View{
        
        
        VStack{
            Text("**Highlight**")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .foregroundColor(Color("color2"))
            HStack(alignment: .center){
                Image("high")
                    .resizable()
                    .frame(width: 30, height: 40)
                    .padding(.horizontal, 30)
                Image("high")
                    .resizable()
                    .frame(width: 30, height: 40)
                    .padding(.horizontal, 30)
                Image("high")
                    .resizable()
                    .frame(width: 30, height: 40)
                    .padding(.horizontal, 30)
            }
            .padding(.all)
            
            VStack{
                Text("Birthday party")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(Color.pink)
                
                HStack(){
                    Text("Created by: Ana Gramatkovska |")
                        .foregroundColor(Color.gray)
                    Text("Date: 03.09.2022")
                        .foregroundColor(Color.gray)
                }
                Image("event2")
                    .resizable()
                    .frame(width: 200, height: 130)
                
            }
            .padding(.all)
            
            
            
            
        }
        
        
    }}

struct MyEventsView_Previews: PreviewProvider {
    static var previews: some View {
        MyEventsView()
    }
}
