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
    var body: some View {
        NavigationView {
            
            VStack {
                Image("Logo").resizable().scaledToFit().frame(width:200,height: 120)
                TextField("Enter text to search", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                NavigationLink("", destination: ContentView(inputTitle: searchText), isActive: $isNavigationActive)
                    .opacity(0)
                
                Button(action: {
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
    
    struct SearchResultsView: View {
        @Binding var searchText: String
        
        var body: some View {
            Text("Search Results for: \(searchText)")
                .font(.title)
                .padding()
        }
    }
    struct SearchView_Previews: PreviewProvider {
        static var previews: some View {
            SearchView()
        }
    }
    }
