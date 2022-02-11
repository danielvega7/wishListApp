//
//  ViewControllerSignIn.swift
//  wishListApp
//
//  Created by Daniel Vega on 1/29/22.
//

import UIKit

class ViewControllerSignIn: UIViewController {
    
    @IBOutlet weak var firstButton: UIButton!
    
    @IBOutlet weak var secondButton: UIButton!
    
    
    @IBOutlet weak var firstImageView: UIImageView!
    
    @IBOutlet weak var secondImageView: UIImageView!
    
    @IBOutlet weak var labelUnderHello: UILabel!
    
    // added 
    
    @IBOutlet var firstImageViewTapGestureRecognizer: UITapGestureRecognizer!
    
    @IBOutlet var secondImageViewTapGestureRecognizer: UITapGestureRecognizer!
    
    var which = 0
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var signInSignUpButton: UIButton!
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        firstButton.titleLabel?.textColor = UIColor.orange
        secondButton.titleLabel?.textColor = UIColor.lightGray
        
        firstImageView.backgroundColor = UIColor.orange
        secondImageView.backgroundColor = UIColor.lightGray

    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red: 0.9137, green: 0.9255, blue: 0.9686, alpha: 1)
        
        usernameTextField.layer.cornerRadius = 15
        passwordTextField.layer.cornerRadius = 15
        
        signInSignUpButton.backgroundColor = UIColor.blue
        signInSignUpButton.titleLabel?.textColor = UIColor.white
        signInSignUpButton.layer.cornerRadius = 20
    }
    
    
    @IBAction func firstButtonAction(_ sender: UIButton) {
        which = 1
        firstButton.titleLabel?.textColor = UIColor.orange
        secondButton.titleLabel?.textColor = UIColor.lightGray
        
        firstImageView.backgroundColor = UIColor.orange
        secondImageView.backgroundColor = UIColor.lightGray
        
        signInSignUpButton.titleLabel?.text = "Sign In"
        
        labelUnderHello.text = "Sign In to Your Account"
        
    }
    
    
    @IBAction func secondButtonAction(_ sender: UIButton) {
        which = 2
        firstButton.titleLabel?.textColor = UIColor.lightGray
        secondButton.titleLabel?.textColor = UIColor.orange
        
        firstImageView.backgroundColor = UIColor.lightGray
        secondImageView.backgroundColor = UIColor.orange
        
        signInSignUpButton.titleLabel?.text = ""
        signInSignUpButton.titleLabel?.text = "Sign Up"
        labelUnderHello.text = "Sign Up to Create Your Account"
        
    }
    
    
    @IBAction func firstImageViewTapGestureRecognizerAction(_ sender: UITapGestureRecognizer) {
        
        firstButton.titleLabel?.textColor = UIColor.orange
        secondButton.titleLabel?.textColor = UIColor.lightGray
        
        firstImageView.backgroundColor = UIColor.orange
        secondImageView.backgroundColor = UIColor.lightGray
        
        signInSignUpButton.titleLabel?.text = "Sign In"
        
        labelUnderHello.text = "Sign In to Your Account"
        
    }
    
    @IBAction func secondImageViewTapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        
        firstButton.titleLabel?.textColor = UIColor.lightGray
        secondButton.titleLabel?.textColor = UIColor.orange
        
        firstImageView.backgroundColor = UIColor.lightGray
        secondImageView.backgroundColor = UIColor.orange
        
        signInSignUpButton.titleLabel?.text = "Sign Up"
        
        labelUnderHello.text = "Sign Up to Create Your Account"
        
    }
    
    @IBAction func signInAction(_ sender: UIButton) {
        var isValid = false
        var index = -1
        var name = ""
        var password = ""
        if usernameTextField.text != "" {
            name = usernameTextField.text!
            if "" != passwordTextField.text {
                password = passwordTextField.text!
                if which == 1 {
                    var i = 0
                    while(i < StaticClass.userArray.count) {
                        if name == StaticClass.userArray[i].username {
                            isValid = true
                            index = i
                        }
                        i += 1
                    }
                    
                    if isValid {
                        StaticClass.currentUser = StaticClass.userArray[index]
                    }
                    else {
                        let unotfoundController = UIAlertController(title: "User Not Found", message: nil, preferredStyle: .alert)
                        let cancel = UIAlertAction(title: "Try Again", style: .cancel, handler: nil)
                        unotfoundController.addAction(cancel)
                        present(unotfoundController, animated: true)
                    }
                }
                else {
                    
                    var i = 0
                    var isValid = true
                    
                    while(i < StaticClass.userArray.count) {
                        if StaticClass.userArray[i].username == name {
                            isValid = false
                            
                        }
                        i += 1
                    }
                    
                    if isValid {
                        StaticClass.userArray.append(User(u: name, p: password, i: UIImage(named: "defaultUser")!))
                        var j = 0
                        while(j < StaticClass.userArray.count) {
                            if StaticClass.userArray[i].username == name {
                                StaticClass.currentUser = StaticClass.userArray[i]
                                
                            }
                            j += 1
                        }
                       
                    }
                    else {
                        let unotfoundController = UIAlertController(title: "Username already used", message: nil, preferredStyle: .alert)
                        let cancel = UIAlertAction(title: "Enter New Username", style: .cancel, handler: nil)
                        unotfoundController.addAction(cancel)
                        present(unotfoundController, animated: true)
                    }
                }
               
            }
            else{
                let unotfoundController = UIAlertController(title: "Password Empty", message: nil, preferredStyle: .alert)
                let cancel = UIAlertAction(title: "Try Again", style: .cancel, handler: nil)
                unotfoundController.addAction(cancel)
                present(unotfoundController, animated: true)
            }
        }
        else {
            let unotfoundController = UIAlertController(title: "Username Empty", message: nil, preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Try Again", style: .cancel, handler: nil)
            unotfoundController.addAction(cancel)
            present(unotfoundController, animated: true)
        }
    }
    
    
    
    
    
}
