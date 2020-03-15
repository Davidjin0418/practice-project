//
//  ContentView.swift
//  swift-hackernews-intermediate
//
//  Created by Bojun Jin on 7/03/20.
//  Copyright © 2020 Bojun Jin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView {
            List(networkManager.posts){ post in
                HStack {
                    Text(String(post.points))
                    Text(post.title)
                }
            }
            .navigationBarTitle("Hacker News")
        }.onAppear{
            self.networkManager.fecthData()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






