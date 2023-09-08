//
//  SearchView.swift
//  Influence me!
//
//  Created by user on 6/9/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @State private var isNavigationActive: Bool = false
    @State var titles:[String]
    var body: some View {
        
        
            NavigationStack{
                VStack {
                    Image("Logo").resizable().scaledToFit().frame(width:200,height: 120)
                    HStack{
                        TextField("Enter text to search", text: $searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding([.top, .leading, .bottom])
                        Button (action: {
                            searchText=""
                        }){
                            
                            Image(systemName: "xmark.circle").foregroundColor(.gray)
                        }.padding(.trailing, 10.0)
                        
                    }
                    
                    NavigationLink {
                        ContentView(inputTitle: searchText, titles: [""])
                    } label: {
                        HStack {
                            Text("Search")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                        }
                        .background(Color.blue)
                        .cornerRadius(10)
                    }
                    
                }
                
            }.background(.blue)
        
        
    }
    
    struct SearchView_Previews: PreviewProvider {
        static var previews: some View {
            SearchView(titles: [""])
        }
    }
    }
