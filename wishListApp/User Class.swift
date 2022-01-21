//
//  User Class.swift
//  wishListApp
//
//  Created by Daniel Vega on 1/7/22.
//

import Foundation
import UIKit

public class Items{
    var name: String
    var link: String
    init(n: String, l: String){
        name = n
        link = l
    }
}
public class User{
    var username: String
    var password: String
    var userImage: UIImage
    var itemArray = [Items]()
    init(u: String, p: String, i: UIImage) {
        username = u
        password = p
        userImage = i
    }
    
}
