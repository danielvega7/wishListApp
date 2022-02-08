//
//  ViewControllerSignIn.swift
//  wishListApp
//
//  Created by Daniel Vega on 1/29/22.
//

import UIKit

class ViewControllerSignIn: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInAction(_ sender: UIButton) {
        if let name = usernameTextField.text {
            if let password = passwordTextField.text {
                StaticClass.currentUser = User(u: name, p: password, i: UIImage(named: "defaultUser")!)
            }
            else {
                
            }
        }
        else {
            
        }
    }
    
}
