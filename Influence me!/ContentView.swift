//
//  ContentView.swift
//  Influence me!
//
//  Created by user on 6/9/23.
//

import SwiftUI

struct ContentView: View {
    
   
    var inputTitle:String
    @State var displayedTitles: [String] = []
    
    var body: some View {
        VStack {
            Button("Refresh") {
                refreshTitles()
            }
            HStack{
                VStack{
                    Text("Title ideas for:").bold()
                    Text("'\(inputTitle)'")
                }
                
            }
        }
        VStack {
            
            
            
            List {
                Section(header: Text("Recommend Ideas")) {
                    ForEach(displayedTitles, id: \.self) { title in
                        Text(title)
                            .foregroundColor(.black)
                            .onTapGesture {
                                let pasteboard = UIPasteboard.general
                                pasteboard.string = title
                            }
                    }
                }
            }
        }
        .onAppear {
            refreshTitles()
        }
    }
    
    func refreshTitles() {
        if titles.isEmpty {
            // Handle case when the titles array is empty
            return
        }
        
        // Shuffle the titles array to get random elements
        titles.shuffle()
        
        // Take the first 3 elements to display
        displayedTitles = Array(titles.prefix(5))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(inputTitle: "text")
    }
}
