//
//  ViewController.swift
//  wishListApp
//
//  Created by DANIEL VEGA on 1/5/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var createAGroupButton: UIButton!
    
    @IBOutlet weak var joinAGroupButton: UIButton!
    
    @IBOutlet weak var createAListButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = UIColor(red: 0.9137, green: 0.9255, blue: 0.9686, alpha: 1)
        
        createAGroupButton.backgroundColor = UIColor(red: 0.1255, green: 0.4, blue: 0.9333, alpha: 1)
        createAGroupButton.layer.cornerRadius = 25
        
        joinAGroupButton.backgroundColor = UIColor(red: 1, green: 0.498, blue: 0.4235, alpha: 1)
        joinAGroupButton.layer.cornerRadius = 25
        
        createAListButton.backgroundColor = UIColor(red: 0, green: 0.7176, blue: 0.3333, alpha: 1)
        createAListButton.layer.cornerRadius = 25
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      
    }
    
    
    @IBAction func createAGroupButtonAction(_ sender: UIButton) {
        createAGroupButton.backgroundColor = UIColor(red: 0.8431, green: 0.8745, blue: 0.8863, alpha: 1)
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
    
    
 

    
    
    
}

