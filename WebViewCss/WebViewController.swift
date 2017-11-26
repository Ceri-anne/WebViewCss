//
//  WebViewController.swift
//  WebViewJS
//
//  Created by Jackson, Ceri-anne (Associate Software Developer) on 25/11/2017.
//  Copyright © 2017 Jackson, Ceri-anne (Associate Software Developer). All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    var colour: String?
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.google.co.uk")!
        webView.load(URLRequest(url: url))
    }
    
    func getHexColour() -> String? {
        if let colour = colour {
            switch colour {
            case "Red" : return "#FF0000"
            case "Green" : return "#00FF00"
            case "Blue" : return "#0000FF"
            default  : return nil
            }
        }
        return nil
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        guard let colour = getHexColour() else {
            return
        }
        
        let css = "body { background-color : \(colour) }"
        
        let js = "var style = document.createElement('style'); style.innerHTML = '\(css)'; document.head.appendChild(style);"
        
        webView.evaluateJavaScript(js, completionHandler: nil)
    }

}

