//
//  AllEventsView.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 26.1.23.
//

import SwiftUI
import Foundation


struct AllEventsView: View{
    
    
    @StateObject var viewModel = AllEventsViewModel()
    @State private var text = ""
//    var eventId : String
//    var event : Event
    var body: some View{
        NavigationStack{
            List{
                //                SearchBar(text: $text, onTextChanged: viewModel.searchEvents)
                
                ForEach(viewModel.eventsList, id: \.id) { event in
                    NavigationLink{
                        DetailEventView(eventId: event.eventId ?? "")
                    } label: {
                        
                    VStack(alignment: .center, spacing: 13){
                Text(event.name ?? "")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.pink)
                
                Text("\(event.createdBy?.firstName)" as String)
                    .foregroundColor(Color.black)
                
                Text("\(event.location)" as String)
                    .foregroundColor(Color.black)
                
                
                if let thumbnailUrl = event.thumbnailUrl, !thumbnailUrl.isEmpty {
                    AsyncImage(url: URL(string: thumbnailUrl)) { image in
                        image.resizable()
                            .frame(width: 100, height: 100) // adjust the size as needed
                    } placeholder: {
                        Image(systemName: "photo") // a default placeholder image
                            .resizable()
                            .frame(width: 100, height: 100) // adjust the size as needed
                    }
                } else {
                    Image(event.thumbnailUrl ?? "")
                        .resizable()
                        .frame(width: 100, height: 100) // adjust the size as needed
                }
                
                    } 
                        
                    }
                        
                        
                        
        }
            }
            
            
            .searchable(text: $text, prompt: "Find event"){
                
            }
//            .onChange(of: text) { text in
//                if !text.isEmpty{
//                    viewModel.eventsList = viewModel.eventsList.filter{
//                        $0.name?.contains(text)
//                    }
//                }else {
//                    viewModel.eventsList = viewModel.eventsList
//                }
//                }
//
//            }
            //            {
//                if viewModel.eventsList.isEmpty{}          }
//            .onAppear{
//                viewModel.searchEvents()
//
//            }
//                ForEach(viewModel.eventsList, id: \.id) { event in
//
//                    Text(event.name ?? "")
//                }
            
        }
    }
}
         


struct AllEventsView_Previews: PreviewProvider {
    static var previews: some View {
        AllEventsView()
    }
}
