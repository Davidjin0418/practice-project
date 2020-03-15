//
//  DetailView.swift
//  swift-hackernews-intermediate
//
//  Created by Bojun Jin on 15/03/20.
//  Copyright © 2020 Bojun Jin. All rights reserved.
//

import SwiftUI
import WebKit

struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https//www.google.com")
    }
}

struct WebView : UIViewRepresentable{
    let urlString: String?
    func makeUIView(context: Context) -> WebView.UIViewType {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString){
                let request = URLRequest(url:url)
                uiView.load(request)
            }
        }
    }
}
