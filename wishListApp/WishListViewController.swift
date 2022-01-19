//
//  WishListViewController.swift
//  wishListApp
//
//  Created by Daniel Vega on 1/13/22.
//

import UIKit

class WishListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    

    @IBOutlet weak var userLabelOutlet: UILabel!
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
   
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        userLabelOutlet.text = StaticClass.currentUser.username
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        return cell
    }
  

}
