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
    let imagePicker = UIImagePickerController()
   
    
    func textChange( t: String) {
        
        
        textLabelOutlet.text = t
        
    }
    func imageChange(i: UIImage) {
        imageOutlet.image = i
    }
    func setAction(a: UIButton) {
        changePhotoButton = a
    }
    
    @IBAction func changePhotoAction(_ sender: UIButton) {
        print("he nice")
    }
    
//    func presentAlertController(){
//
//    let alertController = UIAlertController(title: "Add User",
//                                                        message: nil,
//                                                        preferredStyle: .alert)
//
//
//        let accessCameraAction = UIAlertAction(title: "Camera", style: .default) {_ in
//            if UIImagePickerController.isSourceTypeAvailable(.camera){
//                imagePicker.sourceType = UIImagePickerController.SourceType.camera
//            }
//            else{
//                imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
//            }
//
//            present(imagePicker, animated: true, completion: nil)
//        }
//
//
//
//                }
//                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//
//                alertController.addAction(addUserAction)
//
//                self.present(alertController,
//                             animated: true)
//
//
//    }
    


}
