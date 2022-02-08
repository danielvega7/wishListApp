//
//  ViewControllerSignIn.swift
//  wishListApp
//
//  Created by Daniel Vega on 1/29/22.
//

import UIKit

class ViewControllerSignIn: UIViewController {
    
    
    @IBOutlet weak var signInOrSignUpSegmentedControl: UISegmentedControl!
    
    
    override func viewWillAppear(_ animated: Bool) {
 
        signInOrSignUpSegmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "DINCondensed-Bold", size: 18),
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
            ], for: .normal)
        signInOrSignUpSegmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "DINCondensed-Bold", size: 18),
            NSAttributedString.Key.foregroundColor: UIColor.orange
            ], for: .selected)
        
        let buttonBar = UIView()
        // This needs to be false since we are using auto layout constraints
        buttonBar.translatesAutoresizingMaskIntoConstraints = false
        buttonBar.backgroundColor = UIColor.orange
        // Below view.addSubview(segmentedControl)
        view.addSubview(buttonBar)
        // Constrain the top of the button bar to the bottom of the segmented control
        buttonBar.topAnchor.constraint(equalTo: signInOrSignUpSegmentedControl.bottomAnchor).isActive = true
        buttonBar.heightAnchor.constraint(equalToConstant: 5).isActive = true
        // Constrain the button bar to the left side of the segmented control
        buttonBar.leftAnchor.constraint(equalTo: signInOrSignUpSegmentedControl.leftAnchor).isActive = true
        // Constrain the button bar to the width of the segmented control divided by the number of segments
        buttonBar.widthAnchor.constraint(equalTo: signInOrSignUpSegmentedControl.widthAnchor, multiplier: 1 / CGFloat(signInOrSignUpSegmentedControl.numberOfSegments)).isActive = true

    }
    
    @IBAction func signInOrSignUpSegmentedControlChanged(_ sender: UISegmentedControl) {
        signInOrSignUpSegmentedControl.backgroundColor = .clear
        signInOrSignUpSegmentedControl.tintColor = .clear
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
