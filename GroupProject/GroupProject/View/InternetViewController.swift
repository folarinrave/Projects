//
//  InternetViewController.swift
//  GroupProject
//
//  Created by Daniel Brannon on 11/2/21.
//
import UIKit
import WebKit
class ViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.bottlerocketstudios.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }}