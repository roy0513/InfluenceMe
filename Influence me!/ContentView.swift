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
    @State var titles:[String]
    @State private var showAlert = false
    var body: some View {
        NavigationView {
            Text("Title ideas for:").bold()
        }
        VStack {
            ZStack{
                
                Text("\(inputTitle)")
                    .frame(alignment: .center)
                HStack(){
                    Spacer()
                    Button(action: {
                        
                        refreshTitles()
                    }) {
                        Label("", systemImage: "arrow.counterclockwise.circle")
                    }
                    
                }}
            .padding()
            List {
                Section(header: Text("Recommend Ideas ✨")) {
                    ForEach(displayedTitles, id: \.self) { title in
                        
                            
                        HStack(){
                                Text(title)
                                    .foregroundColor(.black)
                                    
                            Spacer()
                                Image(systemName: "list.clipboard").onTapGesture {
                                    let pasteboard = UIPasteboard.general
                                    pasteboard.string = title
                                    showAlert = true
                                }.alert(isPresented: $showAlert) {
                                    Alert(title: Text("Copied to clipboard"), dismissButton: .default(Text("OK")) 
                                    )
                                }
                                
                            }
                        
                        
                        
                    }
                }.listRowBackground(Capsule().fill(Color.white).padding(.vertical,10)).listRowSeparator(.hidden).headerProminence(.increased)
            }.environment(\.defaultMinListRowHeight, 100)
        }
        .onAppear {
            query(for: inputTitle)
            refreshTitles()}
        .frame(height:700,alignment: .top)
        
        
        
    }
    
    func refreshTitles() {
        print(titles)
        if titles.isEmpty {
            // Handle case when the titles array is empty
            return
        }
        
        // Shuffle the titles array to get random elements
        titles.shuffle()
        
        // Take the first 3 elements to display
        displayedTitles = Array(titles.prefix(5))
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
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(inputTitle: "text",titles: [""])
    }
}
