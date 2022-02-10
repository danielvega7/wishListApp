//
//  WishListViewController.swift
//  wishListApp
//
//  Created by Daniel Vega on 1/13/22.
//

import UIKit

class WishListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    var fosho = 0

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
        return StaticClass.currentUser.groupArray[StaticClass.indexOf].users.count
    }
         

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 40
    }
         
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 40
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor =  UIColor(cgColor: .init(red: 100, green: 1, blue: 100, alpha: 1))
             
           let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 40))
           lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.text = StaticClass.currentUser.groupArray[StaticClass.indexOf].users[section].username
           view.addSubview(lbl)
           return view
         }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = StaticClass.currentUser.groupArray[StaticClass.indexOf].users[indexPath.section].itemArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    @IBAction func editAction(_ sender: UIButton) {
        StaticClass.currentUser.groupArray[StaticClass.indexOf].users.append(User(u: "default \(fosho)", p: "default", i: UIImage(named: "defaultUser")!))
        fosho += 1
        tableViewOutlet.reloadData()
//        performSegue(withIdentifier: "editToAdd", sender: nil)
    }
    

}
