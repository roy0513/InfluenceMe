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
        NavigationView {
            
            VStack {
                Image("Logo").resizable().scaledToFit().frame(width:200,height: 120)
                TextField("Enter text to search", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                NavigationLink("", destination: ContentView(inputTitle: searchText, titles: titles), isActive: $isNavigationActive)
                    .opacity(0)
                
                Button(action: {
                    query(for: searchText)
                    isNavigationActive = true
                    
                }) {
                    Text("Search")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
            
        }
    }
    
    func query(for title:String){
        if title=="Food"{
            titles=titlesFood
            print(titles)
        }else if title=="Politic"{
            titles=titlesPolitic
        }else if title=="Fashion"{
            titles=titlesFashion
        }else{
            titles=["No result"]
        }
    }
    struct SearchView_Previews: PreviewProvider {
        static var previews: some View {
            SearchView(titles: [""])
        }
    }
    }
