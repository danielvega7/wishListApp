//
//  CustomCell.swift
//  wishListApp
//
//  Created by DANIEL VEGA on 1/7/22.
//

import Foundation
import UIKit

public class CustomCell: UICollectionViewCell, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var textLabelOutlet: UILabel!
    @IBOutlet weak var optionButtonOutlet: UIButton!
    @IBOutlet weak var changePhotoButton: UIButton!
    
    var isClicked = false
    
    func textChange( t: String) {
        
        
        textLabelOutlet.text = t
        
    }
    func imageChange(i: String) {
        imageOutlet.image = UIImage(named: i)
    }
    func setAction(a: UIButton) {
        changePhotoButton = a
    }
    
    @IBAction func changePhotoAction(_ sender: UIButton) {
        presentAlertController()
        isClicked = true
       
    }
    
    func presentAlertController(){

    let alertController = UIAlertController(title: "Add User",
                                                        message: nil,
                                                        preferredStyle: .alert)


        let accessCameraAction = UIAlertAction(title: "Camera", style: .default) {_ in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                StaticClass.imagePicker.sourceType = UIImagePickerController.SourceType.camera
                print("happened 2")
            }
            else{
                StaticClass.imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                print("happened 3")
            }
            
//            present(StaticClass.imagePicker, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(accessCameraAction)
        alertController.addAction(cancelAction)
        
        StaticClass.alertController = alertController
//        self.present(alertController,
//                     animated: true)


                }
                


    }
    



