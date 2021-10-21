//
//  Coordinator.swift
//  SeanCollectionViewProject
//
//  Created by Sean Jones on 10/21/21.
//

import Foundation
import UIKit

class Coordinator {
    let navigationContorller: UINavigationController
    
    init(_ rootController: UIViewController) {
        self.navigationContorller = UINavigationController(rootViewController: rootController)
    }
}

extension Coordinator: ViewControllerDelegate {
    func next(url: String) {
        let postVC = UIStoryboard(name: "Post", bundle: .main).instantiateViewController(withIdentifier: "PostVC") as! PostViewController
        
        postVC.url = url
        navigationContorller.pushViewController(postVC, animated: true)
        
    }
    
    
}
