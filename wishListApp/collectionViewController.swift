//
//  collectionViewController.swift
//  wishListApp
//
//  Created by DANIEL VEGA on 1/7/22.
//

import UIKit
public class StaticClass: Codable{
    
    static var userArray = [User]()
    static var currentUser = User(u: "default", p: "default", i: UIImage(named: "defaultUser")!)
}
class collectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
   
    

    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewOutlet.dataSource = self
        collectionViewOutlet.delegate = self
        
//        if let users = UserDefaults.standard.data(forKey: "users") {
//            let decoder = JSONDecoder()
//            if let decoded = try? decoder.decode([User].self, from: users){
//                StaticClass.userArray = decoded
//               
//            }
//        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StaticClass.userArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CustomCell
        cell.textChange(t: StaticClass.userArray[indexPath.row].username)
        cell.imageChange(i: StaticClass.userArray[indexPath.row].userImage)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "userToList", sender: nil)
    }
    
    func presentAlertController(){
        
            let alertController = UIAlertController(title: "Add User",
                                                    message: nil,
                                                    preferredStyle: .alert)
            alertController.addTextField { (textField) in
                textField.placeholder = "User name"
                
                
            }
        alertController.addTextField { (textField) in
            textField.placeholder = "Password"
            
            
        }
           
            let addUserAction = UIAlertAction(title: "Add", style: .default) { [weak alertController] _ in guard let textFields = alertController?.textFields else { return }
                if let userName = textFields[0].text {
                    if let password = textFields[1].text{
                        StaticClass.userArray.append(User(u: userName, p: password, i: UIImage(named: "defaultUser")!))
//                        let encoder = JSONEncoder()
//
//                        if let encoded = try? encoder.encode(StaticClass.userArray) {
//
//                            UserDefaults.standard.set(encoded, forKey: "users")
//
//                        }
                    }
                                                   
                                                    
                }
                
                
                self.collectionViewOutlet.reloadData()
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            alertController.addAction(addUserAction)
            
            self.present(alertController,
                         animated: true)
           
        }
    
    @IBAction func addAction(_ sender: UIButton) {
        
     presentAlertController()
        
    }
    
}
