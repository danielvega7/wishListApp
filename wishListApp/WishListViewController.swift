//
//  WishListViewController.swift
//  wishListApp
//
//  Created by Daniel Vega on 1/13/22.
//

import UIKit
import Firebase
class WishListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var longPressGestureRecognizerOnTableView: UILongPressGestureRecognizer!
    
    let db = Firestore.firestore()
    
    var fosho = 0
    
    var whichClicked = -1;

    @IBOutlet weak var userLabelOutlet: UILabel!
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        tableViewOutlet.clipsToBounds = true
        tableViewOutlet.layer.cornerRadius = 30
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        userLabelOutlet.text = StaticClass.currentUser.groupArray[StaticClass.indexOf].groupName
        tableViewOutlet.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return StaticClass.currentUser.groupArray[StaticClass.indexOf].users[section].itemArray.count
        
        
       //stuff happened to push
        //yessah
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        print("number of sections happened")
        return StaticClass.currentUser.groupArray[StaticClass.indexOf].users.count
    }
         

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        print("height for section header happened")
           return 40
    }
         
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print("height for row table view happened")
           return 40
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor =  UIColor(cgColor: .init(red: 100, green: 1, blue: 100, alpha: 1))
             
           let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 40))
           lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.text = StaticClass.currentUser.groupArray[StaticClass.indexOf].users[section].username
           view.addSubview(lbl)
        print("section happened")
           return view
         }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = StaticClass.currentUser.groupArray[StaticClass.indexOf].users[indexPath.section].itemArray[indexPath.row].name
        print("cell happened")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func presentAlertController(){
        
            
                let alertController = UIAlertController(title: "Add Group Member",
                                                        message: nil,
                                                        preferredStyle: .alert)
                alertController.addTextField { (textField) in
                    textField.placeholder = "Member Name"
                    
                    
                }
    //        alertController.addTextField { (textField) in
    //            textField.placeholder = "Password"
    //
    //
    //        }
               
                let addGroupAction = UIAlertAction(title: "Add", style: .default) { [weak alertController] _ in guard let textFields = alertController?.textFields else { return }
                    if let memberName = textFields[0].text {
                        
                        StaticClass.currentUser.groupArray[StaticClass.indexOf].users.append(User(u: memberName, p: "default", i: UIImage(named: "defaultUser")!))
    //                        let encoder = JSONEncoder()
    //
    //                        if let encoded = try? encoder.encode(StaticClass.userArray) {
    //
    //                            UserDefaults.standard.set(encoded, forKey: "users")
    //
    //                        }
                        
                                                       
                                                        
                    }
                    
                    
                    self.tableViewOutlet.reloadData()
                }
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)
                alertController.addAction(addGroupAction)
                
                self.present(alertController,
                             animated: true)
        
        // swanky
               
            }
    
    @IBAction func addUserAction(_ sender: UIButton) {
        presentAlertController()
        tableViewOutlet.reloadData()
    }
    @IBAction func editAction(_ sender: UIButton) {
        performSegue(withIdentifier: "editToAdd", sender: nil)
//        performSegue(withIdentifier: "editToAdd", sender: nil)
    }
    
    
    
    @IBAction func longPressGestureRecognizerOnTableViewAction(_ sender: UILongPressGestureRecognizer) {
        
        if sender.state == .began {
            
            let touchPoint = sender.location(in: tableViewOutlet)
            
            if let indexPath = tableViewOutlet.indexPathForRow(at: touchPoint) {
                
                whichClicked = indexPath.row
                
                let alertController = UIAlertController(title: "Options", message: nil, preferredStyle: .alert)
                
                let copyAction = UIAlertAction(title: "Copy Item", style: .default, handler: nil)
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                
                alertController.addAction(copyAction)
                alertController.addAction(cancelAction)
                self.present(alertController, animated: true)
               
            }
         
            // Fatal error for alert controller
            
            
        }
        
    }
    func write() {
       
        db.collection("wishlist").document("withlist").setData(["users": StaticClass.groupArray], merge: true)

    }
    

}
