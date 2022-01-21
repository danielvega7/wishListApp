//
//  collectionViewController.swift
//  wishListApp
//
//  Created by DANIEL VEGA on 1/7/22.
//

import UIKit
//import DropDown

public class StaticClass: Codable{
    
    static var userArray = [User]()
    static var currentUser = User(u: "default", p: "default", i: UIImage(named: "defaultUser")!)
    static var imagePicker = UIImagePickerController()
    static var alertController = UIAlertController()
    
}
class collectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
   
    

    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    var whichClicked = -1
    @IBOutlet var longPressGestureOutlet: UILongPressGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StaticClass.imagePicker.delegate = self
        longPressGestureOutlet.delegate = self
        // Set the background of the view to this image
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "defaultCollectionViewBackground2")!)
        
        // Made the collection view transparent
        collectionViewOutlet.backgroundColor = UIColor.clear.withAlphaComponent(0)

        // Added delegate and datasource to collection view controller
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
        StaticClass.currentUser = StaticClass.userArray[indexPath.row]
        performSegue(withIdentifier: "userToList", sender: nil)
        
    }
    
    //function for the add user. Called in the add action
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
    
    
    @IBAction func longPressOptionsAction(_ sender: UILongPressGestureRecognizer) {
        
        if sender.state == .began {
            let touchPoint = sender.location(in: collectionViewOutlet)
            if let indexPath = collectionViewOutlet.indexPathForItem(at: touchPoint) {
                whichClicked = indexPath.row
                print(StaticClass.userArray[whichClicked].username)
            }
            let alertController = UIAlertController(title: "Options", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
            let accessLibraryAction = UIAlertAction(title: "Access Library", style: .default){_ in
                StaticClass.imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                self.present(StaticClass.imagePicker, animated: true, completion: nil)
                self.collectionViewOutlet.reloadData()
            }
            let accessCameraAction = UIAlertAction(title: "Camera", style: .default) {_ in
                if UIImagePickerController.isSourceTypeAvailable(.camera){
                    StaticClass.imagePicker.sourceType = UIImagePickerController.SourceType.camera
                    self.collectionViewOutlet.reloadData()
                }
                else{
                    StaticClass.imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                    self.collectionViewOutlet.reloadData()
                }
                self.collectionViewOutlet.reloadData()
                self.present(StaticClass.imagePicker, animated: true, completion: nil)
            }
            alertController.addAction(accessCameraAction)
            alertController.addAction(accessLibraryAction)
            alertController.addAction(action)
            
            
            self.present(alertController,
                         animated: true)
           
        
        
    }
    
    
}
    //image picker function
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {  picker.dismiss(animated: true) {
        StaticClass.userArray[self.whichClicked].userImage = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
        self.collectionViewOutlet.reloadData()
    }
    }
}
