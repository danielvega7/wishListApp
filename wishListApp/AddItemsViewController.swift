//
//  AddItemsViewController.swift
//  wishListApp
//
//  Created by DANIEL VEGA on 1/20/22.
//

import UIKit
import Firebase
//pushing

class AddItemsTableViewCell : UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rightDetailButton: UIButton!
    
    
}


class AddItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var indexOfLinkClicked = -1
    
    var selectedRow = 0
    
    var selectedCellsArray : [Bool] = []

    @IBOutlet weak var tableViewOultet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOultet.delegate = self
        tableViewOultet.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //StaticClass.currentUser
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        StaticClass.currentUser.itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! AddItemsTableViewCell
        
        cell.titleLabel?.text = StaticClass.currentUser.itemArray[indexPath.row].name
        if (StaticClass.currentUser.itemArray[indexPath.row].link.count <= 20) {
            cell.rightDetailButton?.setTitle(StaticClass.currentUser.itemArray[indexPath.row].link, for: .normal)
        }
        
        cell.rightDetailButton.tag = indexPath.row
        print("\(StaticClass.currentUser.itemArray[indexPath.row].name) - \(cell.rightDetailButton.tag)")
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            StaticClass.userArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
          
        }
    }
    @IBAction func addAction(_ sender: UIButton) {
        presentAlertController()
        tableViewOultet.reloadData()
    }
    
    func presentAlertController(){
        
            let alertController = UIAlertController(title: "Add Item",
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
                        self.selectedCellsArray.append(false)
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let cell = tableViewOultet.cellForRow(at: indexPath)
        
        if(selectedCellsArray[indexPath.row] == false) {            cell!.backgroundColor = UIColor(red: 0, green: 0.7373, blue: 0.7882, alpha: 1)
            selectedCellsArray[indexPath.row] = true
        }
        else {
            cell!.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            selectedCellsArray[indexPath.row] = false
        }
        
    }
        
    
    
    // TEST BUTTON - DELETE LATER
    
    
    @IBAction func testButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "toWebViewController", sender: nil)
    }
    
    
    // TEST BUTTON - DELETE LATER
    
    
    
    @IBAction func linkButtonAction(_ sender: UIButton) {
        
        if (verifyUrl(urlString: StaticClass.currentUser.itemArray[indexOfLinkClicked].link) == true) {
        
        indexOfLinkClicked = sender.tag
        performSegue(withIdentifier: "toWebViewController", sender: nil)
            
        }
        
        else {
            
            let invalidLinkAlertController = UIAlertController(title: "Invalid Link", message: "The URL of this link is not valid.", preferredStyle: .alert)
            
            let changeLinkAlertAction = UIAlertAction(title: "Change Link", style: .destructive, handler: <#T##((UIAlertAction) -> Void)?##((UIAlertAction) -> Void)?##(UIAlertAction) -> Void#>)
            let cancelLinkAction = UIAlertAction(title: "Close", style: .cancel, handler: nil)
            
            invalidLinkAlertController.addAction(changeLinkAlertAction)
            invalidLinkAlertController.addAction(cancelLinkAction)
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nvc = segue.destination as! WebViewController

        nvc.stringLink = StaticClass.currentUser.itemArray[indexOfLinkClicked].link
    }
    
    
    func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
    
    
    
}
