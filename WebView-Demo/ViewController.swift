//
//  ViewController.swift
//  WebView-Demo
//
//  Created by JINSEOK on 2023/07/12.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    lazy var button1: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("Safari App", for: .normal)
        button.frame = CGRect(x: 100, y: 300, width: 200, height: 50)
        button.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
        button.tag = 0
        return button
    }()
    
    lazy var button2: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("SFSafariViewController", for: .normal)
        button.frame = CGRect(x: 100, y: 400, width: 200, height: 50)
        button.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
        button.tag = 1
        return button
    }()
    
    lazy var button3: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("WKWebView", for: .normal)
        button.frame = CGRect(x: 100, y: 500, width: 200, height: 50)
        button.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
        button.tag = 2
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        let buttons = [button1, button2, button3]
        buttons.forEach { self.view.addSubview($0) }
    }
    
    @objc func buttonHandler(_ sender: UIButton) {
        switch sender.currentTitle {
        case "Safari App":
            guard let url = URL(string: "https://www.apple.com"),
                  UIApplication.shared.canOpenURL(url) else { return }
            
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            
        case "SFSafariViewController":
            guard let url = URL(string: "https://www.apple.com") else { return }
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true)

        case "WKWebView":
            let webVC = WebViewController()
            webVC.url = URL(string: "https://www.apple.com")
            present(webVC, animated: true)
            
        default: break
        }
    }
}

