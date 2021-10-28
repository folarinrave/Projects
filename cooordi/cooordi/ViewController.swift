//
//  ViewController.swift
//  cooordi
//
//  Created by Limei  Chen on 10/21/21.
//

import UIKit

protocol ViewControllerDelegate {
    func go()
}

class ViewController: UIViewController {
    
    var delegate: ViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func create () -> ViewController {
        let controller = UIStoryboard(name: "Main", bundle: .main).instantiateInitialViewController() as! ViewController
        return controller
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        delegate.go()
    }
    
}

