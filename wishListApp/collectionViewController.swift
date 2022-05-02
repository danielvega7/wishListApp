//
//  collectionViewController.swift
//  wishListApp
//
//  Created by DANIEL VEGA on 1/7/22.
//
//please chupapi munyano
import UIKit
import Firebase

public class StaticClass: Codable{
    static var groupArray = [Groups]()
    static var indexOf = 0
    static var userArray = [User]()
    static var currentUser = User(u: "default", p: "default", i: "defaultUser")
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
        return StaticClass.currentUser.groupArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CustomCell
        cell.textChange(t: StaticClass.currentUser.groupArray[indexPath.row].groupName)
        cell.imageChange(i: StaticClass.currentUser.groupArray[indexPath.row].groupImage)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        StaticClass.indexOf = indexPath.row
//        StaticClass.groupArray[StaticClass.indexOf].add()
//        StaticClass.groupArray[StaticClass.indexOf].add()
        performSegue(withIdentifier: "userToList", sender: nil)
        
    }
    
    //function for the add user. Called in the add action
    func presentAlertController(){
        
            let alertController = UIAlertController(title: "Add Group",
                                                    message: nil,
                                                    preferredStyle: .alert)
            alertController.addTextField { (textField) in
                textField.placeholder = "Group name"
                
                
            }
//        alertController.addTextField { (textField) in
//            textField.placeholder = "Password"
//
//
//        }
           
            let addGroupAction = UIAlertAction(title: "Add", style: .default) { [weak alertController] _ in guard let textFields = alertController?.textFields else { return }
                if let groupName = textFields[0].text {
                    
                    StaticClass.currentUser.groupArray.append(Groups(gn: groupName, gi: "defaultUser"))
//                        let encoder = JSONEncoder()
//
//                        if let encoded = try? encoder.encode(StaticClass.userArray) {
//
//                            UserDefaults.standard.set(encoded, forKey: "users")
//
//                        }
                    
                                                   
                                                    
                }
                
                
                self.collectionViewOutlet.reloadData()
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            alertController.addAction(addGroupAction)
            
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
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       // var temp: UIImage
        picker.dismiss(animated: true) {
        //StaticClass.currentUser.groupArray[self.whichClicked].groupImage = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
            
            
            
        self.collectionViewOutlet.reloadData()
    }
    }
}
