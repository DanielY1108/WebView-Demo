//
//  WebViewController.swift
//  WebView-Demo
//
//  Created by JINSEOK on 2023/07/12.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var url: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        setupUI()
        loadWebView()
    }
    
    func setupUI() {
        webView = WKWebView(frame: .zero)
        view.addSubview(webView)
        webView.frame = view.frame
        webView.navigationDelegate = self
    }
    
    func loadWebView() {
        guard let url = url else { return }
        let requset = URLRequest(url: url)
        webView.load(requset)
    }
    
    func loadHTML() {
        let description = """
                   <html>
                   <div align="center">
                   <h1>This is a heading</h1>
                   <p>Hello, Swift!</p>
                   <script src="https://gist.github.com/DanielY1108/1a18fe6e7d01c317351d23dba7927691.js"></script>
                   </div>
                   </html>
                   """
        var headerString = "<header><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0'></header>"
        
        headerString.append(description)
        webView.loadHTMLString(headerString, baseURL: nil)
    }
}



