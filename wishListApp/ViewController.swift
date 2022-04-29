//
//  ViewController.swift
//  wishListApp
//
//  Created by DANIEL VEGA on 1/5/22.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    let db = Firestore.firestore()
    //var ref = Database.database().reference()
    
    
    @IBOutlet weak var createAGroupButton: UIButton!
    
    @IBOutlet weak var joinAGroupButton: UIButton!
    
    @IBOutlet weak var createAListButton: UIButton!
    
    
    @IBOutlet weak var logInButton: UIBarButtonItem!
    
    @IBOutlet weak var logInButtonSegment: UIButton!
    @IBOutlet weak var usernameUser: UILabel!
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = UIColor(red: 0.9137, green: 0.9255, blue: 0.9686, alpha: 1)
        
        createAGroupButton.backgroundColor = UIColor(red: 0.1255, green: 0.4, blue: 0.9333, alpha: 1)
        createAGroupButton.layer.cornerRadius = 25
        
        joinAGroupButton.backgroundColor = UIColor(red: 1, green: 0.498, blue: 0.4235, alpha: 1)
        joinAGroupButton.layer.cornerRadius = 25
        
        createAListButton.backgroundColor = UIColor(red: 0, green: 0.7176, blue: 0.3333, alpha: 1)
        createAListButton.layer.cornerRadius = 25
        
        logInButtonSegment.backgroundColor = UIColor(patternImage: UIImage(named: "logInBackgroundColor")!)
        logInButtonSegment.layer.cornerRadius = 20
        
        if StaticClass.currentUser.username != "default" {
            print("happening")
            usernameUser.text = StaticClass.currentUser.username
           // logInButton.title = "ur mom"
           // logInButton.setTitle("Logout", for: .normal)
        }
        else{
            usernameUser.text = ""
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      
    }
    
    
    
    @IBAction func createAGroupButtonAction(_ sender: UIButton) {
        createAGroupButton.backgroundColor = UIColor(red: 0.8431, green: 0.8745, blue: 0.8863, alpha: 1)
        //do {sleep(1)}
        performSegue(withIdentifier: "toCollectionViewController", sender: nil)
    }
    
    @IBAction func joinAGroupButtonAction(_ sender: UIButton) {
        joinAGroupButton.backgroundColor = UIColor(red: 0.8431, green: 0.8745, blue: 0.8863, alpha: 1)
        performSegue(withIdentifier: "toCollectionViewController", sender: nil)
    }
    
    
    @IBAction func createAListButtonAction(_ sender: UIButton) {
        createAListButton.backgroundColor = UIColor(red: 0.8431, green: 0.8745, blue: 0.8863, alpha: 1)
        performSegue(withIdentifier: "toCollectionViewController", sender: nil)
    }
    
   
    
    //    @IBAction func logInButtonSegmentAction(_ sender: UIButton) {
//        performSegue(withIdentifier: "toViewController", sender: nil)
//    }
    
    
    
    
    
}

