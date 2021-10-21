//
//  SecondViewController.swift
//  SeanCoordinatorProject
//
//  Created by Sean Jones on 10/14/21.
//

import UIKit

protocol SecondViewControllerDelegate {
    func next(firstWord: String, secondWord: String)
}


class SecondViewController: UIViewController, UITextFieldDelegate {
    var secondVCDelegate: SecondViewControllerDelegate?
    //MARK: - PROPERTIES
    var firstWord: String?
    var secondWord: String?
    
    //MARK: - OUTLETS

    @IBOutlet weak var secondWordTextField: UITextField!
    
    //MARK: LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondWordTextField.delegate = self

       
    }
    
    //MARK: ACTIONS/METHODS
    
    static func create() -> ViewController {
        let controller = UIStoryboard(name: "Second", bundle: .main).instantiateViewController(withIdentifier: "SecondVC") as! ViewController
        
        return controller
    }
    
   
    @IBAction func buttonTapped(_ sender: Any) {
        
        guard let second = secondWordTextField.text else { return}
        self.secondWord = second
        secondVCDelegate?.next(firstWord: firstWord!, secondWord: secondWord!)

        
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
