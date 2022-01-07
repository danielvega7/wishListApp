//
//  CustomCell.swift
//  wishListApp
//
//  Created by DANIEL VEGA on 1/7/22.
//

import Foundation
import UIKit

public class CustomCell: UICollectionViewCell {
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var textLabelOutlet: UILabel!
    @IBOutlet weak var optionButtonOutlet: UIButton!
    
    func textChange( t: String) {
        
        
        textLabelOutlet.text = t
        
    }
    func imageChange(i: UIImage) {
        imageOutlet.image = i
    }
    
    
    

}
