//
//  TitlesView.swift
//  Influence me!
//
//  Created by user on 6/9/23.
//

import SwiftUI
import UIKit
struct TitlesView: View {
    
    var body: some View {
        List {
            Section(header:Text("Recommend Ideas")){
                //loop through addresses array in AddressList.swift file
                ForEach(titles, id:\.self) { title in

                  Button(action: {
                    let pasteboard = UIPasteboard.general
                    pasteboard.string = title
                  }) {
                      Text(title).foregroundColor(.black)
                  }

                }
            }
        }
        
    }
}

struct TitlesView_Previews: PreviewProvider {
    static var previews: some View {
        TitlesView()
    }
}
