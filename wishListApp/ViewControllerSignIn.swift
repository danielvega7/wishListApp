//
//  ViewControllerSignIn.swift
//  wishListApp
//
//  Created by Daniel Vega on 1/29/22.
//

import UIKit

class ViewControllerSignIn: UIViewController {
    
    @IBOutlet weak var segmentedControlStackView: UIStackView!
    
    @IBOutlet weak var firstButton: UIButton!
    
    @IBOutlet weak var secondButton: UIButton!
    
    
    @IBOutlet weak var firstImageView: UIImageView!
    
    @IBOutlet weak var secondImageView: UIImageView!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        firstButton.titleLabel?.textColor = UIColor.orange
        secondButton.titleLabel?.textColor = UIColor.orange

    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
