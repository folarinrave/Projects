//
//  PostViewController.swift
//  SeanCollectionViewProject
//
//  Created by Sean Jones on 10/21/21.
//

import UIKit
import WebKit

class PostViewController: UIViewController {
    
    let webView = WKWebView()
    var url: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        if let urlString = self.url {
        guard let url = URL(string:urlString) else {return}
            webView.load(URLRequest(url: url))
        }
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
