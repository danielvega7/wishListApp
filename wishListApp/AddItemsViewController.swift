//
//  AddItemsViewController.swift
//  wishListApp
//
//  Created by DANIEL VEGA on 1/20/22.
//

import UIKit

class AddItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var tableViewOultet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOultet.delegate = self
        tableViewOultet.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        StaticClass.currentUser.itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = StaticClass.currentUser.itemArray[indexPath.row].name
        return cell
    }
    
    @IBAction func addAction(_ sender: UIButton) {
        presentAlertController()
        tableViewOultet.reloadData()
    }
    
    func presentAlertController(){
        
            let alertController = UIAlertController(title: "Add User",
                                                    message: nil,
                                                    preferredStyle: .alert)
            alertController.addTextField { (textField) in
                textField.placeholder = "Item name"
                
                
            }
        alertController.addTextField { (textField) in
            textField.placeholder = "Link"
            
            
        }
           
            let addUserAction = UIAlertAction(title: "Add", style: .default) { [weak alertController] _ in guard let textFields = alertController?.textFields else { return }
                if let itemName = textFields[0].text {
                    if let link = textFields[1].text{
                        StaticClass.currentUser.itemArray.append(Items(n: itemName, l: link))
//                        let encoder = JSONEncoder()
//
//                        if let encoded = try? encoder.encode(StaticClass.userArray) {
//
//                            UserDefaults.standard.set(encoded, forKey: "users")
//
//                        }
                    }
                                                   
                                                    
                }
                
                
                self.tableViewOultet.reloadData()
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            alertController.addAction(addUserAction)
            
            self.present(alertController,
                         animated: true)
           
        }
}
