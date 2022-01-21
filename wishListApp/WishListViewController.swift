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
        tableViewOutlet.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StaticClass.currentUser.itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = StaticClass.currentUser.itemArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    @IBAction func editAction(_ sender: UIButton) {
        performSegue(withIdentifier: "editToAdd", sender: nil)
    }
    

}
